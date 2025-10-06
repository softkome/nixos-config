use std::collections::HashSet;
use std::env;
use std::fs;
use std::path::Path;

/// Count packages for NixOS by looking at symlinked executables and extracting
/// unique `/nix/store/<store-entry>` identifiers.
///
/// Returns (system_pkgs, user_pkgs).
pub fn get_package_counts() -> (usize, usize) {
    let system_count = count_unique_store_entries_in_bin_dir("/run/current-system/sw/bin");
    let user_profile_bin = user_profile_bin_path();
    let user_count = count_unique_store_entries_in_bin_dir(&user_profile_bin);

    (system_count, user_count)
}

/// Helper: returns "/nix/var/nix/profiles/per-user/<USER>/profile/bin"
fn user_profile_bin_path() -> String {
    // Fallback to $HOME/.nix-profile/bin if profile path isn't present
    if let Ok(user) = env::var("USER") {
        let per_user = format!("/nix/var/nix/profiles/per-user/{}/profile/bin", user);
        if Path::new(&per_user).exists() {
            return per_user;
        }
    }

    // Fallback: ~/.nix-profile/bin (works if user has a default profile)
    if let Ok(home) = env::var("HOME") {
        let fallback = format!("{}/.nix-profile/bin", home);
        return fallback;
    }

    // Last resort
    "/nonexistent".to_string()
}

/// Count unique store-entry strings referenced by symlink targets inside a `bin`-like dir.
/// e.g. if `/run/current-system/sw/bin/foo -> /nix/store/<hash>-pkg/bin/foo`
/// we extract `<hash>-pkg` and count unique ones.
fn count_unique_store_entries_in_bin_dir<P: AsRef<Path>>(dir: P) -> usize {
    let mut set = HashSet::new();
    let p = dir.as_ref();

    if !p.exists() {
        return 0;
    }

    // If dir is readable, iterate
    let entries = match fs::read_dir(p) {
        Ok(e) => e,
        Err(_) => return 0,
    };

    for entry in entries.filter_map(Result::ok) {
        let path = entry.path();

        // Try to resolve symlink target; if not a symlink, try to read the file metadata's canonicalized path
        match fs::read_link(&path) {
            Ok(target) => {
                if let Some(store_entry) = extract_store_entry_from_path(&target) {
                    set.insert(store_entry);
                }
            }
            Err(_) => {
                // Not a symlink — try to canonicalize; sometimes entries are executables directly in store
                if let Ok(canon) = path.canonicalize() {
                    if let Some(store_entry) = extract_store_entry_from_path(&canon) {
                        set.insert(store_entry);
                    }
                }
            }
        }
    }

    set.len()
}

/// Given a path like `/nix/store/<store-entry>/...` returns `Some("<store-entry>")`.
/// Otherwise returns None.
fn extract_store_entry_from_path<P: AsRef<Path>>(p: P) -> Option<String> {
    let path = p.as_ref();

    // Walk components to find "nix"/"store" and get the next component
    let mut comps = path.components().map(|c| c.as_os_str().to_string_lossy().to_string());
    while let Some(c) = comps.next() {
        if c == "nix" {
            if let Some(next) = comps.next() {
                if next == "store" {
                    if let Some(store_entry) = comps.next() {
                        return Some(store_entry);
                    } else {
                        return None;
                    }
                }
            } else {
                return None;
            }
        }
    }

    None
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_extract_store_entry() {
        let p = Path::new("/nix/store/abcd1234-example-1.0/bin/foo");
        let s = extract_store_entry_from_path(p).expect("should find store entry");
        assert_eq!(s, "abcd1234-example-1.0");
    }
}


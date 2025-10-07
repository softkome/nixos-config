use std::process::Command;
use std::path::Path;
use std::env;

pub fn get_package_counts() -> (usize, usize, usize) {
    // System packages
    let nix_system = count_nix_profile("/nix/var/nix/profiles/system");
    
    let user = env::var("USER").unwrap_or_default();
    let home = env::var("HOME").unwrap_or_default();
    
    // Try multiple locations for user packages
    let mut nix_user = 0;
    
    if !user.is_empty() {
        // Check per-user directory for any profiles
        let per_user_dir = format!("/nix/var/nix/profiles/per-user/{}", user);
        if let Ok(entries) = std::fs::read_dir(&per_user_dir) {
            for entry in entries.flatten() {
                let path = entry.path();
                if path.is_symlink() || path.is_dir() {
                    let path_str = path.to_string_lossy().to_string();
                    // Skip channels
                    if !path_str.contains("channels") {
                        let count = count_nix_profile(&path_str);
                        if count > 0 {
                            nix_user += count;
                        }
                    }
                }
            }
        }
        
        // Also check home-manager in home directory
        let hm_profile = format!("{}/.local/state/home-manager/gcroots/current-home", home);
        if Path::new(&hm_profile).exists() {
            let count = count_nix_profile(&hm_profile);
            if count > 0 {
                nix_user += count;
            }
        }
    }
    
    // Default profile (usually empty but check anyway)
    let nix_default = if !home.is_empty() {
        let default_profile = format!("{}/.nix-profile", home);
        if Path::new(&default_profile).exists() {
            count_nix_profile(&default_profile)
        } else {
            0
        }
    } else {
        0
    };
    
    (nix_system, nix_user, nix_default)
}

fn count_nix_profile(profile_path: &str) -> usize {
    if !Path::new(profile_path).exists() {
        return 0;
    }
    
    // Get all requisites (dependencies) of the profile
    let output = Command::new("nix-store")
        .args(["--query", "--requisites", profile_path])
        .output();
    
    let Ok(out) = output else { 
        return 0; 
    };
    
    if !out.status.success() {
        return 0;
    }
    
    String::from_utf8_lossy(&out.stdout)
        .lines()
        .filter(|line| is_valid_nix_pkg(line))
        .count()
}

fn is_valid_nix_pkg(path: &str) -> bool {
    // Must be a directory path in nix store
    if !path.starts_with("/nix/store/") {
        return false;
    }
    
    // Get just the package name (after last /)
    let pkg = match path.rsplit('/').next() {
        Some(p) => p,
        None => return false,
    };
    
    // Filter out system packages and meta-packages
    if pkg.starts_with("nixos-system-nixos-")
        || pkg.ends_with("-doc")
        || pkg.ends_with("-man")
        || pkg.ends_with("-info")
        || pkg.ends_with("-dev")
        || pkg.ends_with("-bin")
    {
        return false;
    }
    
    // Check if package name contains a version number (digit.digit pattern)
    has_version_pattern(pkg)
}

fn has_version_pattern(s: &str) -> bool {
    let bytes = s.as_bytes();
    let mut i = 0;
    
    while i < bytes.len() {
        // Look for a digit
        if bytes[i].is_ascii_digit() {
            i += 1;
            
            // Skip more digits
            while i < bytes.len() && bytes[i].is_ascii_digit() {
                i += 1;
            }
            
            // Check for dot
            if i < bytes.len() && bytes[i] == b'.' {
                i += 1;
                
                // Check for digit after dot
                if i < bytes.len() && bytes[i].is_ascii_digit() {
                    return true; // Found pattern like "1.2"
                }
            }
        } else {
            i += 1;
        }
    }
    
    false
}

pub fn get_package_counts_combined() -> (usize, usize) {
    let (system, user, default) = get_package_counts();
    (system, user + default)
}


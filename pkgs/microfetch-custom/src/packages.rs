use std::{env, fs};

pub fn get_package_counts() -> (usize, usize) {
    // Count system packages
    let sys_path = "/run/current-system/sw";
    let sys_count = count_entries(sys_path);

    // Count user packages (using $USER)
    let user = env::var("USER").unwrap_or_else(|_| "unknown".into());
    let user_profile = format!("/nix/var/nix/profiles/per-user/{user}/profile");
    let user_count = count_entries(&user_profile);

    (sys_count, user_count)
}

fn count_entries(path: &str) -> usize {
    if let Ok(entries) = fs::read_dir(path) {
        entries.filter_map(|e| e.ok()).count()
    } else {
        0
    }
}


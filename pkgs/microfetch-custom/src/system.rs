use nix::sys::{statvfs::statvfs, utsname::UtsName};
use std::{env, io};

pub fn get_username_and_hostname(utsname: &UtsName) -> String {
    let username = env::var("USER").unwrap_or_else(|_| "unknown_user".to_string());
    let hostname = utsname
        .nodename()
        .to_str()
        .unwrap_or("unknown_host")
        .to_string();
    format!("{username}@{hostname}")
}

pub fn get_root_disk_usage() -> Result<String, io::Error> {
    let vfs = statvfs("/")?;
    let block_size = vfs.block_size() as u64;
    let total_blocks = vfs.blocks();
    let available_blocks = vfs.blocks_available();

    let total_size = block_size * total_blocks;
    let used_size = total_size - (block_size * available_blocks);

    let total_size = total_size as f64 / (1024.0 * 1024.0 * 1024.0);
    let used_size = used_size as f64 / (1024.0 * 1024.0 * 1024.0);
    let usage = (used_size / total_size) * 100.0;

    Ok(format!("{used_size:.2} GiB / {total_size:.2} GiB ({usage:.0}%)"))
}


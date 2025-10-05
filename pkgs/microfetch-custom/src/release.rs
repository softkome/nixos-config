use nix::sys::utsname::UtsName;
use std::{
    fs::File,
    io::{self, BufRead, BufReader},
};

pub fn get_system_info(utsname: &UtsName) -> String {
    format!(
        "{} {} ({})",
        utsname.sysname().to_str().unwrap_or("Unknown"),
        utsname.release().to_str().unwrap_or("Unknown"),
        utsname.machine().to_str().unwrap_or("Unknown")
    )
}

pub fn get_os_pretty_name() -> Result<String, io::Error> {
    let file = File::open("/etc/os-release")?;
    let reader = BufReader::new(file);

    for line in reader.lines() {
        let line = line?;
        if let Some(pretty_name) = line.strip_prefix("PRETTY_NAME=") {
            if let Some(trimmed) = pretty_name
                .strip_prefix('"')
                .and_then(|s| s.strip_suffix('"'))
            {
                return Ok(trimmed.to_string());
            }
            return Ok(pretty_name.to_string());
        }
    }
    Ok("Unknown".to_string())
}


{ config, pkgs, ... }:

{
  #### Enable NetworkManager
  networking.networkmanager.enable = true;

  #### Disable Wi-Fi power saving
  networking.networkmanager.wifi.powersave = false;

  #### Ensure firmware is available
  hardware.enableAllFirmware = true;

  #### Kernel module options for RTL8192EE
  boot.extraModprobeConfig = ''
    options rtl8192ee swenc=1 fwlps=0 ips=0
  '';
}

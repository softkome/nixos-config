{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;
  hardware.enableAllFirmware = true;

  #### Kernel module options for RTL8192EE
  boot.extraModprobeConfig = ''
    options rtl8192ee swenc=1 fwlps=0 ips=0
  '';
}

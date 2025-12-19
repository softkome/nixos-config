{lib, ...}: {
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;

  hardware.enableAllFirmware = true;
}

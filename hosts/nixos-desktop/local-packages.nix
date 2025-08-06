{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim  # text editor
    pulseaudio  # for pactl CLI usage
    networkmanager #network manager package
    usbutils #usb utilities
    nh #nix helper
  ];
}

{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim  # text editor
    pulseaudio  # for pactl CLI usage
    networkmanager #network manager package
    usbutils #usb utilities
    nh #nix helper
    age # age keygen
    sops # encription
  ];

  nixpkgs.overlays = [
    (final: prev: {
      microfetch-custom = import ../../pkgs/microfetch-custom { pkgs = final; };
    })
  ];
}

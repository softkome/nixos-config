{
  imports = [
    ./boot.nix
    ./locale.nix
    ./networking.nix
    ./hardware.nix
    ./nix.nix
    ./home-manager.nix
    ./local-packages.nix
    ./unfree.nix
    ./stylix.nix
    ./sops.nix

#    ./wm/niri.nix
    ./wm/hyprland.nix
  ];
}

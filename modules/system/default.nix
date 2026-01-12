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
    ./uwsm.nix

    ./wm/hyprland.nix
    ./wm/niri.nix
  ];
}

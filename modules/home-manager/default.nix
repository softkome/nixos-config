{
  imports = [
    ./cli/bat.nix
    ./cli/eza.nix
    ./cli/fish.nix
    ./cli/git.nix
    ./cli/lf.nix
    ./cli/neovim.nix
    ./cli/ranger.nix
    ./cli/starship.nix
    ./cli/tmux.nix

    ./gui/qutebrowser.nix

    ./terminal/alacritty.nix
    ./terminal/foot.nix

    ./wm/hyprland

    ./ui/fuzzel/fuzzel.nix
    ./ui/swaync/swaync.nix
    ./ui/waybar/waybar.nix

    ./env.nix
    ./home-packages.nix
    ./stylix.nix
    ./toggles.nix
    ./custom-scripts.nix
  ];
}

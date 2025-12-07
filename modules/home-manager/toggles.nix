{ config, lib, ... }: {
  options = {
    components.hyprland = lib.mkEnableOption "Hyprland Window Manager";
    components.hyprpaper = lib.mkEnableOption "Hyperpaper";
    components.hypridle = lib.mkEnableOption "Hyprpaper";
    components.hyprlock = lib.mkEnableOption "Hyprlock";

    components.fuzzel = lib.mkEnableOption "Fuzzel";
    components.waybar = lib.mkEnableOption "Waybar";
    components.swaync = lib.mkEnableOption "SwayNC";

    components.alacritty = lib.mkEnableOption "Alacritty";
    components.bat = lib.mkEnableOption "Bat";
    components.fish = lib.mkEnableOption "Fish Shell";
    components.neovim = lib.mkEnableOption "Neovim";
    components.ranger = lib.mkEnableOption "Ranger";
    components.git = lib.mkEnableOption "Git";
    components.starship = lib.mkEnableOption "Starship";
    components.stylix = lib.mkEnableOption "Stylix";
    components.tmux = lib.mkEnableOption "Tmux";
    components.baseEnv = lib.mkEnableOption "Session Variables";
    components.eza = lib.mkEnableOption "Eza";
    components.qutebrowser = lib.mkEnableOption "Qutebrowser";
    components.foot = lib.mkEnableOption "Foot";
    components.lf = lib.mkEnableOption "lf";
    components.firefox = lib.mkEnableOption "Firefox";
  };
}

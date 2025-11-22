{ config, ... }: {
  components.hyprland = true;
  components.hyprpaper = true;
  components.hypridle = true;
  components.hyprlock = true;

  components.fuzzel = true;
  components.waybar = true;
  components.swaync = true;

  components.alacritty = false; #false
  components.bat = true;
  components.fish = true;
  components.neovim = true;
  components.ranger = true;
  components.git = true;
  components.starship = true;
  components.stylix = true;
  components.tmux = true;
  components.baseEnv = true;
  components.eza = true;
  components.qutebrowser = true;
  components.foot = true;

  home.sessionVariables = {
    TERMINAL = "foot";
    EDITOR = "nvim";
  };
}

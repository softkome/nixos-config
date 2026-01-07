{lib, ...}: {
  options.features = {
    wm = {
      hyprland.enable =
        lib.mkEnableOption "Hyprland window manager";
      hypridle.enable =
        lib.mkEnableOption "Hypridle idle daemon";
      hyprlock.enable =
        lib.mkEnableOption "Hyprlock screen locker";

      niri.enable =
        lib.mkEnableOption "Niri window manager";
    };

    ui = {
      bar.waybar.enable =
        lib.mkEnableOption "Waybar status bar";
      notifications.swaync.enable =
        lib.mkEnableOption "Sway Notification Center";
      launcher.fuzzel.enable =
        lib.mkEnableOption "Fuzzel application launcher";
    };

    terminal = {
      enable =
        lib.mkEnableOption "Enable a terminal emulator";

      provider = lib.mkOption {
        type = lib.types.enum ["foot" "alacritty"];
        default = "foot";
        description = "Preferred terminal emulator";
      };
    };

    cli = {
      shell.fish.enable =
        lib.mkEnableOption "Fish shell";

      tools = {
        neovim.enable =
          lib.mkEnableOption "Neovim editor";
        git.enable =
          lib.mkEnableOption "Git version control";
        tmux.enable =
          lib.mkEnableOption "Tmux terminal multiplexer";
        bat.enable =
          lib.mkEnableOption "Bat pager";
        eza.enable =
          lib.mkEnableOption "Eza file lister";
        ranger.enable =
          lib.mkEnableOption "Ranger file manager";
        lf.enable =
          lib.mkEnableOption "lf file manager";
        starship.enable =
          lib.mkEnableOption "Starship prompt";
      };
    };

    gui = {
      browser = {
        qutebrowser.enable =
          lib.mkEnableOption "Qutebrowser browser";
      };
    };

    theme.stylix.enable =
      lib.mkEnableOption "Stylix theming system";

    env.session.enable =
      lib.mkEnableOption "Session environment variables";
  };
}

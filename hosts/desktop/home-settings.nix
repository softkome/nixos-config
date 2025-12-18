{ config, ... }: {
  features = {
    wm = {
      hyprland.enable = true;
      hypridle.enable = true;
      hyprlock.enable = true;
    };

    ui = {
      bar.waybar.enable = true;
      notifications.swaync.enable = true;
      launcher.fuzzel.enable = true;
    };

    terminal = {
      enable = true;
      provider = "foot";
    };

    cli = {
      shell.fish.enable = true;
      tools = {
        git.enable = true;
        neovim.enable = true;
        tmux.enable = true;
        bat.enable = true;
        eza.enable = true;
        ranger.enable = true;
        lf.enable = true;
        starship.enable = true;
      };
    };

    gui = {
      browser = {
        firefox.enable = false;
        qutebrowser.enable = false;
      };
    };

    theme.stylix.enable = true;
    env.session.enable = true;
  };




  home.sessionVariables = {
    TERMINAL = "foot";
    EDITOR = "nvim";
  };
}

{
  lib,
  config,
  pkgs,
  assetsDir,
  ...
}: let
  cfg = config.features.theme.stylix;
in {
  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      polarity = "dark";
      base16Scheme = "${assetsDir}/colours/gruvbox.yaml";

      targets = {
        neovim.enable = true;
        waybar.enable = false;
        wofi.enable = false;
        hyprland.enable = false;
        hyprlock.enable = false;
        mako.enable = false;
        swaync.enable = false;
      };

      cursor = {
        name = "Bibata-Modern-Ice";
        size = 20;
        package = pkgs.bibata-cursors;
      };

      fonts = {
        emoji = {
          name = "Noto Color Emoji";
          package = pkgs.noto-fonts-color-emoji;
        };
        monospace = {
          name = "JetBrains Mono";
          package = pkgs.jetbrains-mono;
        };
        sansSerif = {
          name = "Noto Sans";
          package = pkgs.noto-fonts;
        };
        serif = {
          name = "Noto Serif";
          package = pkgs.noto-fonts;
        };

        sizes = {
          terminal = 13;
          applications = 11;
        };
      };

      iconTheme = {
        enable = true;
        package = pkgs.papirus-icon-theme;
        dark = "Papirus-Dark";
        light = "Papirus-Light";
      };
    };
  };
}

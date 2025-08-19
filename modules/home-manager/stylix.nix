{ lib, config, pkgs, assetsDir, ... }:
let
  cfg = config.components.stylix;
in
  {
    config = lib.mkIf cfg {
      home.packages = with pkgs; [
        dejavu_fonts
        jetbrains-mono
        noto-fonts
        noto-fonts-lgc-plus
        texlivePackages.hebrew-fonts
        noto-fonts-emoji
        font-awesome
        powerline-fonts
        powerline-symbols
        pkgs.nerd-fonts.symbols-only
      ];
    
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
    
        image = "${assetsDir}/wallpapers/wallpaper.png";
          
      };
    };
  }

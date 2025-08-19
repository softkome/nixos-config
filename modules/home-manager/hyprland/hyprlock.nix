{ lib, config, ... }:
let
  cfg = config.components.hyprlock;
in
  {
    config = lib.mkIf cfg {
      programs.hyprlock = {
        enable = true;
  
        settings = {
          general = {
            disable_loading_bar = true;
            grace = 10;
            hide_cursor = true;
            no_fade_in = false;
          };
  
          label = {
            text = "$TIME";
            font_size = 96;
            font_family = "JetBrains Mono";
            color = "rgba(235, 219, 178, 1.0)"; # Gruvbox light beige
            position = "0, 600";
            halign = "center";
            walign = "center";
            shadow_passes = 0; # no shadow for cleaner look
          };
  
          background = [
            {
              path = "screenshot";
              blur_passes = 3;
              blur_size = 8;
            }
          ];
  
          input-field = [
            {
              size = "220, 50";
              position = "0, -80";
              monitor = "";
              dots_center = true;
  
              font_color = "rgb(235, 219, 178)";
              inner_color = "rgb(29, 32, 33)";    # #1D2021
              outer_color = "rgb(29, 32, 33)";    # Match inner for borderless look
              outline_thickness = 2;             # Minimal but visible
              placeholder_text = "password";
              shadow_passes = 0;                 # no drop shadow
            }
          ];
        };
      };
    };
  }

{ config, pkgs, lib, ... }:

# Path to your CSS file
let
  cssPath = ./style.css;
in
{
  services.ashell = {
    enable = true;

    # Bar configuration
    bar = {
      position = "top";
      height = 30;
      margin = 0;
      padding = 0;

      # Left: 5 workspaces
      left = [
        {
          type = "workspaces";
          persistent = [1 2 3 4 5];
          showIcons = false;
          spacing = 4;
        }
      ];

      # Center: active window title
      center = [
        {
          type = "window";
          format = "[ {title} ]";
          maxLength = 60;
        }
      ];

      # Right: clock (optional tray can be added here)
      right = [
        {
          type = "clock";
          format = "%d.%m.%Y | %H:%M";
        }
        # Uncomment to enable tray
        # { type = "tray"; iconSize = 14; spacing = 4; }
      ];
    };

    # CSS to match your Waybar look
    extraCss = builtins.readFile cssPath;
  };
}


{ lib, config, ... }:
let
  cfg = config.components.hyprpaper;
in
  {
    config = lib.mkIf cfg {
      services.hyprpaper = {
        enable = true;
      };
    };
  }

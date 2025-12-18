{ lib, config, pkgs, ... }:
let
  cfg = config.features.ui.launcher.fuzzel;
in
  {
    config = lib.mkIf cfg.enable {
      home.packages = [
        pkgs.fuzzel
      ];

      xdg.configFile."fuzzel/fuzzel.ini".source = ./fuzzel.ini;
    };
  }

{ lib, config, pkgs, ... }:
let
  cfg = config.components.fuzzel;
in
  {
    config = lib.mkIf cfg {
      home.packages = [
        pkgs.fuzzel
      ];

      xdg.configFile."fuzzel/fuzzel.ini".source = ./fuzzel.ini;
    };
  }

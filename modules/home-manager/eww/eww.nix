{ lib, config, pkgs, ... }:
let
  cfg = config.components.eww;
in
  {
    config = lib.mkIf cfg {
      home.packages = [ pkgs.eww ];
      xdg.configFile."eww".source = ./eww;
    };
  }

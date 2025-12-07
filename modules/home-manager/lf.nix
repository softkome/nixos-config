{ pkgs, lib, config, ... }:
let
  cfg = config.components.lf;
in
  {
    config = lib.mkIf cfg {
      programs.lf = {
        enable = true;
      };
    };
  }

{ lib, config, ... }:
let
  cfg = config.components.foot;
in
{
  config = lib.mkIf cfg {
    programs.foot = {
      enable = true;

      settings = {
        scrollback = {
          lines = 100;
        };
      };
    };
  };
}


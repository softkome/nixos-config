{ lib, config, ... }:
let
  cfg = config.components.foot;
in
{
  config = lib.mkIf cfg {
    programs.foot = {
      enable = true;

      settings = {
        main = {
          font = lib.mkForce "Bold";
	  };
        scrollback = {
          lines = 100;
        };
      };
    };
  };
}


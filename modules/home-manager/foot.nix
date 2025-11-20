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
	  font = lib.mkForce "JetBrains Mono:size=11";
	};
        scrollback = {
          lines = 100;
        };
      };
    };
  };
}


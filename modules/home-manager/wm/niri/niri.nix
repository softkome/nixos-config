{ lib, config, pkgs, ... }:
let
  cfg = config.features.wm.niri;
in
  {
    config = lib.mkIf cfg.enable {
      programs.niri = {
        enable = true;
	settings = {
	  binds = {
            "Mod+Return" = { action = "spawn"; command = ["foot"]; };
            "Mod+D" = { action = "spawn"; command = ["fuzzel"]; };
            "Mod+Q" = { action = "close-window"; };
	};
      };
    };
  }

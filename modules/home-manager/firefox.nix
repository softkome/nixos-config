{ pkgs, lib, config, assetsDir, ...}:
let
  cfg = config.features.gui.browser.firefox;
in
  {
    config = lib.mkIf cfg.enable {
      programs.firefox = {
        enable = true;
	
	profiles.default = {
	  id = 0;
	  name = "Default";
	  extraConfig = builtins.readFile "${assetsDir}/user.js";
	};
      };
    };
  }

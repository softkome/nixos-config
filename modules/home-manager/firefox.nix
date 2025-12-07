{ pkgs, lib, config, assetsDir, ...}:
let
  cfg = config.components.firefox;
in
  {
    config = lib.mkIf cfg {
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

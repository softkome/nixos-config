{ lib, config, assetsDir, ... }:
let
   cfg = config.components.bat;
in
  {
    config = lib.mkIf cfg {
      programs.bat = {
        enable = true;
	themes = {
	  gruvbox = {
	    src = assetsDir/colours;
	    file = "gruvbox.yaml";
	  };
	};
      };
    };
  }

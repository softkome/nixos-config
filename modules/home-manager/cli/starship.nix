{ lib, config, ... }:
let
  cfg = config.features.cli.tools.starship;
in
  {
    config = lib.mkIf cfg.enable {
      programs.starship = {
        enable = true;
	enableFishIntegration = true;
	settings = {
	  add_newline = false;
	  format = "$directory$git_branch$character";
	  directory = {
	    read_only = " [R]";
	    truncation_length = 2;
	    truncation_symbol = "../";
	    substitutions = {
	    };
	  };
	};
      };
    };
  }

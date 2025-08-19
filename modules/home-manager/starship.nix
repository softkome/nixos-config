{ lib, config, ... }:
let
  cfg = config.components.starship;
in
  {
    config = lib.mkIf cfg {
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

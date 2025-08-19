{ lib, config, ... }:
let
  cfg = config.components.alacritty;
in
  {
    config = lib.mkIf cfg {
      programs.alacritty = {
        enable = true;
	settings = {
	  window.opacity = 1.0;
	  font = {
	    builtin_box_drawing = true;
	    normal = {
	      style = lib.mkForce "Bold";
	    };
	  };
	};
      };
    };
  }

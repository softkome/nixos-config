{ lib, config, ... }:
let
  cfg = config.components.swaync;
in
  {
    config = lib.mkIf cfg {
      services.swaync = {
        enable = true;
	style = ./style.css;
	settings = {
	  position = "top-right";
	  control-center-position = "right";
	  control-center-margin-top = 0;
	  control-center-margin-bottom = 0;
	  contorl-center-margin-right = 0;
	  control-center-margin-left = 0;
	  layer = "overlay";
	  notification-grouping = false;
	};
      };
    };
  }

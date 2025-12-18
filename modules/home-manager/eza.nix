{ lib, config, ... }:
let
  cfg = config.features.cli.tools.eza;
in
  {
    config = lib.mkIf cfg.enable {
      programs.eza = {
        enable = true;
	enableFishIntegration = true;
	colors = "always";
	git = true;
	icons = "always";
	extraOptions = [
	"--group-directories-first"
	"--header"
	];
      };
    };
  }

{ lib, config, pkgs, ... }: 
let
  cfg = config.components.qutebrowser;
in
  {
    config = lib.mkIf cfg {
      programs.qutebrowser = {
        enable = true;
	searchEngines = {
	  g = "https://www.google.com/search?hl=en&q={}";
	};

      };
    };
  {

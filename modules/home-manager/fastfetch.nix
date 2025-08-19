{ lib, config, assetsDir, ... }:
let
  cfg = config.components.fastfetch;
in
  {
    config = lib.mkIf cfg {
      programs.fastfetch = {
        enable = true;
	settings = {
	  logo = {
	    type = "raw";
	    source = "${assetsDir}/fastfetchlogo.txt";
	    width = 12;
	    hight = 4;
	    padding = {
	      top = 1;
	      left = 2;
	    };
	  };
	  modules = [
	    {
	      type = "os";
	      key = " OS";
	    }
            {
              type = "packages";
              key = " Packages";
            }
            {
              type = "uptime";
              key = "󰞌 Uptime";
            }
            {
              type = "shell";
              key = " Shell";
            }
	  ];
	};
      };
    };
  }

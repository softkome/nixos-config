{ pkgs, lib, config, ... }: {

  options = {
    fastfetchMod = lib.mkEnableOption "enables fastfetchMod";
  };

  config = lib.mkIf config.fastfetchMod {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
	  type = "raw";
	  source = ./assets/fastfetchlogo.txt;
	  width = 26;
          height = 15;
          padding = {
            top = 0;
            left = 2;
            right = 6;
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
	]
      };
    };
  };
}

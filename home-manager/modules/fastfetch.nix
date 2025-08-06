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
          width = 12;
          height = 4;
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

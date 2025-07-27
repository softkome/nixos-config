{ pkgs, lib, config, ... }: {

  options = {
    fuzzelMod = lib.mkEnableOption "enables fuzzelMod";
  };

  config = lib.mkIf config.fuzzelMod {
    home.packages = [
      pkgs.fuzzel
    ];
  
    xdg.configFile."fuzzel/fuzzel.ini" = {
      source = ./fuzzel.ini;
    };
  };
}

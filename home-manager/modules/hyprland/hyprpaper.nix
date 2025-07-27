{ lib, config, ... }: {
  
  options = {
    hyprpaperMod = lib.mkEnableOption "enables hyprpaperMod";
  };

  config = lib.mkIf config.hyprpaperMod {
    services.hyprpaper = {
      enable = true; 
    };
  };
}

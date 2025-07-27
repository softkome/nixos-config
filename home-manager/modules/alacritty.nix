{lib, config, ... }:{

  options = {
    alacrittyMod = lib.mkEnableOption "enables alacrittyMod";
  };

  config = lib.mkIf config.alacrittyMod {
    programs.alacritty = {
      enable = true;
      settings = {
        window.opacity = 1.0;
       
        font  = {
          builtin_box_drawing = true;
          normal = {
           style = lib.mkForce "Bold";
          };
        };
      };
    };
  };
}
      

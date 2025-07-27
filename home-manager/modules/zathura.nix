{ lib, config, ...}: {

  options = {
    zathuraMod.enable = lib.mkEnableOption "enables zathuraMod";
  };

  config = lib.mkIf config.zathuraMod.enable {
    programs.zathura = {
      enable = true;
      mappings = {
        D = "toggle_page_mode";
        d = "scroll half_down";
        u = "scroll half_up";
      };
      options = {
        font = "JetBrains Mono Bold 13";
      };
    };
  };
}

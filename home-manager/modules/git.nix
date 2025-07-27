{ lib, config, ...}: {

  options = {
    gitMod.enable = lib.mkEnableOption "enables gitMod";
  };

  config = lib.mkIf config.gitMod.enable {
    programs.git = {
      enable = true;
      userName = "softkome";
      userEmail = "softkome+git@gmail.com";
    };
  };
}

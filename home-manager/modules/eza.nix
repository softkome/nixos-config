{ lib, config, ...}: {

  options = {
    ezaMod = lib.mkEnableOption "enables ezaMod";
  };

  config = lib.mkIf config.ezaMod {
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

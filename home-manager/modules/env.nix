{ lib, config, ... }: {

  options = {
    envMod = lib.mkEnableOption "enables envMod";
  };

  config = lib.mkIf config.envMod {
    home.sessionVariables = {
      TERMINAL = "alacritty";
      EDITOR = "nvim";
      XDG_BIN_HOME = "${config.home.homeDirectory}/.local/bin";
      PATH = "${config.home.homeDirectory}/.local/bin:$PATH";
    };
  };
}

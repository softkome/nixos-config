{ lib, config, ... }:
let
  cfg = config.components.baseEnv;
in
  {
    config = lib.mkIf cfg {
      home.sessionVariables = {
        XDG_BIN_HOME = "${config.home.homeDiretory}/.local/bin";
	PATH = "${config.home.homeDirectory}/.local/bin:$PATH";
      };
    };
  }

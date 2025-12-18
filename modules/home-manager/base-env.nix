{ lib, config, ... }:
let
  cfg = config.features.env.session.enable;
in
  {
    config = lib.mkIf cfg.enable {
      home.sessionVariables = {
        XDG_BIN_HOME = "${config.home.homeDirectory}/.local/bin";
	PATH = "${config.home.homeDirectory}/.local/bin:$PATH";
      };
    };
  }

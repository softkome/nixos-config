{ lib, config, ... }:
let
  cfg = config.features.env.session;
in
  {
    config = lib.mkIf cfg.enable {
      home.sessionVariables = {
        XDG_BIN_HOME = "${config.home.homeDirectory}/.local/bin";
	PATH = "${config.home.homeDirectory}/.local/bin:$PATH";
      };
    };
  }

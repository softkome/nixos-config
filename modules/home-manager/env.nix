{ lib, config, ... }:
let
  cfg = config.features.env.session;
  term = config.features.terminal;
in
  {
    config = lib.mkIf cfg.enable {
      home.sessionVariables = {
        XDG_BIN_HOME = "${config.home.homeDirectory}/.local/bin";
	PATH = "${config.home.homeDirectory}/.local/bin:$PATH";
	TERMINAL = lib.mkIf term.enable term.provider;
	EDITOR = "nvim";
      };
    };
  }

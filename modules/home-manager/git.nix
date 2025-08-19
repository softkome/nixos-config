{ lib, config, ... }:
let
  cfg = config.components.git;
  secrets = import ../../secrets.nix;
in
  {
    config = lib.mkIf cfg {
      programs.git = {
        enable = true;
	userName = secrets.git.userName;
	userEmail = secrets.git.userEmail;
      };
    };
  }

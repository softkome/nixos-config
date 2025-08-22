{ lib, config, osConfig, ... }:
let
  cfg = config.components.git;
  secrets = import ../../secrets.nix;
in
  {
    config = lib.mkIf cfg {
      programs.git = {
        enable = true;
	userName = builtins.readFile osConfig.sops.secrets."git/userName".path;
	userEmail = builtins.readFile osConfig.sops.secrets."git/userEmail".path;
      };
    };
  }

{ lib, config, osConfig, ... }:
let
  cfg = config.features.cli.tools.git;
in
{
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      
      includes = [{
        path = osConfig.sops.templates."git-config".path;
      }];

      settings = {
        init.defaultBranch = "main";
        pull.rebase = false;
        push.default = "simple";
        core.autocrlf = "input";
      };
    };
  };
}

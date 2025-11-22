{ lib, config, osConfig, ... }:
let
  cfg = config.components.git;
in
{
  config = lib.mkIf cfg {
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

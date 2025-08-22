{ lib, config, osConfig, ... }:
let
  cfg = config.components.git;
in
{
  config = lib.mkIf cfg {
    programs.git = {
      enable = true;
      
      # Use the template created by sops-nix instead of reading files directly
      includes = [{
        path = osConfig.sops.templates."git-config".path;
      }];
      
      # Optional: Add other git configuration
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = false;
        push.default = "simple";
        core.autocrlf = "input";
      };
    };
  };
}

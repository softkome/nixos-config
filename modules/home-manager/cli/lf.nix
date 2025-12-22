{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.features.cli.tools.lf;
in {
  config = lib.mkIf cfg.enable {
    programs.lf = {
      enable = true;

      commands = {
        rename = ''
          %{{{
                   printf "Rename '%s' to: " "$f"
                   read new
                   [ -n "$new" ] && mv -- "$f" "$(dirname "$f")/$new"
                 }}}
        '';
      };

      keybindings = {
        r = "rename";
      };
    };
  };
}

{
  lib,
  config,
  assetsDir,
  ...
}: let
  cfg = config.features.cli.tools.bat;
in {
  config = lib.mkIf cfg.enable {
    programs.bat = {
      enable = true;
      themes = {
        gruvbox = {
          src = assetsDir;
          file = "colours/gruvbox.yaml";
        };
      };
    };
  };
}

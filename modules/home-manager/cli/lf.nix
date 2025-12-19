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
    };
  };
}

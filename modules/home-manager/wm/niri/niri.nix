{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.features.wm.niri;
in {
  config = lib.mkIf cfg.enable {
    xdg.configFile."niri/config.kdl".source = ./config.kdl;
  };
}

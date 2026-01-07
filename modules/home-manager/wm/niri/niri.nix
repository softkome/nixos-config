{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.features.wm.niri;
in {
  config = lib.mkIf cfg.enable {
    wayland.windowManager.niri = {
      enable = true;
      systemd.enable = true;

      settings = {
        binds = {
          "Mod+Return" = {
            action = "spawn";
            command = [ "foot" ];
          };

          "Mod+D" = {
            action = "spawn";
            command = [ "fuzzel" ];
          };
        };
      };
    };
  };
}


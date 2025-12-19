{
  lib,
  config,
  ...
}: let
  cfg = config.features.ui.notifications.swaync;
in {
  config = lib.mkIf cfg.enable {
    services.swaync = {
      enable = true;
      style = ./style.css;
      settings = {
        position = "top-right";
        control-center-position = "right";
        control-center-margin-top = 0;
        control-center-margin-bottom = 0;
        contorl-center-margin-right = 0;
        control-center-margin-left = 0;
        layer = "overlay";
        notification-grouping = false;
      };
    };
  };
}

{ lib, config, ... }: {
  options = {
    swayncMod = lib.mkEnableOption "Enable custom swaync styling and configuration";
  };

  config = lib.mkIf config.swayncMod {
    services.swaync = {
      enable = true;
      style = ./style.css;
      settings = {
        position = "top-right";
        control-center-position = "right";

        control-center-margin-top = 0;
        control-center-margin-bottom = 0;
        control-center-margin-left = 0;
        control-center-margin-right = 0;

	dnd-toggle-visible = true;

        layer = "overlay";
      };
    };
  };
}


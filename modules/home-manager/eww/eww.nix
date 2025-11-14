{ lib, config, pkgs, assetsDir, ... }:
let
  cfg = config.components.eww;
in
{
  config = lib.mkIf cfg {
    programs.eww = {
      enable = true;
      configDir = ./eww;
    };

    # Create the eww configuration directory structure
    home.file = {
      "eww/eww.yuck".source = ./eww/eww.yuck;
      "eww/eww.scss".source = ./eww/eww.scss;
      "eww/scripts/microphone.sh" = {
        source = "${assetsDir}/scripts/microphone.sh";
        executable = true;
      };
      "eww/scripts/power-menu.sh" = {
        source = "${assetsDir}/scripts/power-menu.sh";
        executable = true;
      };
    };
  };
}

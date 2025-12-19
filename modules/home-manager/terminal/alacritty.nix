{
  lib,
  config,
  ...
}: let
  cfg = config.features.terminal;
in {
  config = lib.mkIf (cfg.enable && cfg.provider == "alacritty") {
    programs.alacritty = {
      enable = true;
      settings = {
        window.opacity = 1.0;
        font = {
          builtin_box_drawing = true;
          normal = {
            style = lib.mkForce "Bold";
          };
        };
      };
    };
  };
}

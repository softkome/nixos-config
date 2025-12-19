{
  lib,
  config,
  ...
}: let
  cfg = config.features.terminal;
in {
  config = lib.mkIf (cfg.enable && cfg.provider == "foot") {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          font = lib.mkForce "JetBrains Mono:size=11";
        };
        scrollback = {
          lines = 100;
        };
      };
    };
  };
}

{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      niri = {
        prettyName = "Niri";
        comment = "Niri compositor managed by UWSM";
        binPath = lib.getExe pkgs.niri;
      };
    };
  };
}

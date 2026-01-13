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
        binPack = lib.getExe pkgs.niri;
	#binPath = "/run/current-system/sw/bin/niri-session";
      };
    };
  };
}

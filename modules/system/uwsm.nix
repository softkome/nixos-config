{ pkgs, lib, config, ... }:
{
  programs.uwsm = {
    enable = true;
    waylandConpositors = {
     niri = {
       prettyname = "Niri";
       comment = "Niri compositor managed by UWSM";
       binPath = "/run/current-system/sw/bin/niri-session";
     };
    };
  };
}

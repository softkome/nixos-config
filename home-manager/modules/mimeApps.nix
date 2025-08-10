{ config, lib, pkgs, ... }:
{
  options.mimeAppsMod = {
    enable = lib.mkEnableOption "enables mimeAppsMod";
  };

  config = lib.mkIf config.mimeAppsMod {
    xdg = {
      enable = true;

      mimeApps = {
        enable = true;
        defaultApplications = {
          # Images
          "image/png" = [ "imv.desktop" ];
          "image/jpeg" = [ "imv.desktop" ];
          "image/gif" = [ "imv.desktop" ];

          # Videos
          "video/mp4" = [ "mpv.desktop" ];
          "video/x-matroska" = [ "mpv.desktop" ];

          # Web links
          "x-scheme-handler/http" = [ "librewolf.desktop" ];
          "x-scheme-handler/https" = [ "librewolf.desktop" ];
        };
      };
    };
  };
}


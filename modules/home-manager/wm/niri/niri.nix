{ pkgs, lib, config, ... }:
{
  programs.niri = {
    enable = true;
  };

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
}

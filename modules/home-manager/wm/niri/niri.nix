{ pkgs, lib, config, ... }:
{
  xdg.configFile."niri/config.kdl".source = ./config.kdl;
}

{ pkgs, ... }:
{
  programs.niri.enable = true;
  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

  programs.uwsm.enable = true;

  environment.etc."wayland-sessions/niri-uwsm.desktop".text = ''
    [Desktop Entry]
    Name=Niri (UWSM)
    Comment=Niri Wayland compositor managed by UWSM
    Exec=uwsm start niri -- niri
    Type=Application
    DesktopNames=niri
  '';

}

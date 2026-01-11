{ pkgs, ... }:
{
  programs.niri.enable = true;
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

  services.uwsm.enable = true;

  environment.etc."wayland-sessions/niri-uwsm.desktop".text = ''
    [Desktop Entry]
    Name=Niri (UWSM)
    Comment=Niri Wayland compositor managed by UWSM
    Exec=uwsm start niri
    Type=Application
    DesktopNames=niri
  '';

}

{pkgs, ...}: {
  programs.niri.enable = true;
  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}

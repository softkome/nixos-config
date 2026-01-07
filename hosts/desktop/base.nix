{
  hostname,
  homeStateVersion,
  user,
  shell ? "bashInteractive",
  autologin ? false,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    inputs.home-manager.nixosModules.default
    inputs.niri.homeModules.niri
  ];

  networking.hostName = hostname;
  system.stateVersion = homeStateVersion;

  services.getty.autologinUser =
    if autologin
    then user
    else null;

  users.users.${user}.shell = pkgs.${shell};

  # Tweak for rtl8192ee
  boot.extraModprobeConfig = ''
    options rtl8192ee swenc=1 fwlps=0 ips=0
  '';
}

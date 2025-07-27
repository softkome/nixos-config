{ config, pkgs, inputs, user, hostname, homeStateVersion, ... }:

{
  imports = [
    ./local-packages.nix
    ./hardware-configuration.nix
    ../../system-modules
    inputs.home-manager.nixosModules.default 
  ];

  networking.hostName = hostname;

  system.stateVersion = homeStateVersion;
}

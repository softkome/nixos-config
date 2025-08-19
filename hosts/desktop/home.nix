{ user, homeStateVersion, ... }: {
  imports = [
    ../../modules/home-manager
    ./home-settings.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };
}

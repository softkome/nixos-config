{ inputs, user, homeStateVersion, hostNameKey, ... }: {
  home-manager = {
    extraSpecialArgs = {
      inherit inputs user homeStateVersion;
    };

    users.${user} = import ../hosts/${hostNameKey}/home.nix;
  };
}

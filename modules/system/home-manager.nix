{ inputs, user, homeStateVersion, hostNameKey, pkgs, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs user homeStateVersion pkgs;
    };

    users.${user} = import ../../hosts/${hostNameKey}/home.nix;
  };
}


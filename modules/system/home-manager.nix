{ inputs, user, homeStateVersion, hostNameKey, pkgs, assetsDir, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs user homeStateVersion pkgs assetsDir;
    };

    users.${user} = import ../../hosts/${hostNameKey}/home.nix;
  };
}


{
  inputs,
  user,
  homeStateVersion,
  hostname,
  pkgs,
  assetsDir,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs user homeStateVersion pkgs assetsDir;
    };

    users.${user} = import ../../hosts/${hostname}/home.nix;
  };
}

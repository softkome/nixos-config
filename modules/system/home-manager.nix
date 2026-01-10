{
  inputs,
  user,
  homeStateVersion,
  hostname,
  pkgs,
  assetsDir,
  niri,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs user homeStateVersion pkgs assetsDir niri;
    };

    users.${user} = import ../../hosts/${hostname}/home.nix;
  };
}

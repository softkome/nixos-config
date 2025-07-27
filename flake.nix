{
  description = "nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      hosts = {
        "nixos-desktop" = {
          user = "softkome";
          hostname = "nixos-desktop";
          stateVersion = "25.05";
        };
      };

      mkHost = name: cfg:
        nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit inputs system;
            user = cfg.user;
            hostname = cfg.hostname;
            homeStateVersion = cfg.stateVersion;
	    hostNameKey = name;
          };

          modules = [
            ./hosts/${name}/configuration.nix
	    inputs.home-manager.nixosModules.default
	    stylix.nixosModules.stylix
	  ];
        };

    in {
      nixosConfigurations = nixpkgs.lib.mapAttrs mkHost hosts;
    };
}

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

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, stylix, sops-nix, ... }@inputs:
    let
      assetsDir = ./assets;

      # Define hosts here
      hosts = {
        "desktop" = {
	  system = "x86_64-linux";
          user = "softkome";
          hostname = "desktop";
          stateVersion = "25.05";
	  autologin = true;
	  shell = "fish";
	  kernel = "zen"; # or "latest" or "lts"
	  extraModules = [ ./modules/system/wm/hyprland.nix ];
        };
      };

      mkHost = name: cfg:
        nixpkgs.lib.nixosSystem {
          system = cfg.system;
          specialArgs = {
            inherit inputs assetsDir;
	    inherit (cfg) user hostname autologin shell kernel;
            homeStateVersion = cfg.stateVersion;
          };

          modules = [
            ./hosts/${name}/base.nix
	    ./modules/system/user.nix
	    ./modules/system/kernel.nix
            inputs.home-manager.nixosModules.default 
	    stylix.nixosModules.stylix
	    sops-nix.nixosModules.sops
	  ]
	  ++ cfg.extraModules;
        };
      

    in {
      nixosConfigurations = nixpkgs.lib.mapAttrs mkHost hosts;
    };
}

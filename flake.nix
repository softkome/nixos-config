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

  outputs = { self, nixpkgs, home-manager, stylix, sops-nix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
	config.allowUnfree = true;
      };

      assetsDir = ./assets;

      # Define hosts here
      hosts = {
        "desktop" = {
          user = "softkome";
          hostname = "desktop";
          stateVersion = "25.05";
	  autologin = true;
	  shell = "fish";
	  kernel = "zen"; # or "latest" or "lts"
	  extraModules = [ ./modules/window-managers/hyprland.nix ];
        };
      };

      mkHost = name: cfg:
        nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit inputs;
	    inherit system;
	    inherit assetsDir;
            user = cfg.user;
            hostname = cfg.hostname;
            homeStateVersion = cfg.stateVersion;
	    autologin = cfg.autologin;
	    shell = cfg.shell;
	    kernel = cfg.kernel;
	    hostNameKey = name;
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

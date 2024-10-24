{
  description = "First Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    nixpkgs, 
    home-manager, 
    nixvim,
    ... 
  } @ inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      saturn = lib.nixosSystem {
        inherit system;
	modules = [ 
	  ./configuration.nix 
	  home-manager.nixosModules.home-manager
	  {
	    home-manager.useUserPackages = true;
	    home-manager.useGlobalPkgs = true;
	    home-manager.extraSpecialArgs = { inherit inputs; };
	  }
	];
      };
    };

    homeConfigurations = {
      merimak = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
	  nixvim.homeManagerModules.nixvim
          ./home.nix 
	  ./modules/nixvim.nix
	  ./modules/waybar.nix
	  ./modules/lazygit.nix
        ];
      };
    };
  };
}

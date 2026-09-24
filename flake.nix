{
	description = "Nixos Flakes Setup";

	inputs = {

		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
			url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "86x_64-linux";
			modules = [
        home-manager.nixosModules.home-manager
				./configuration.nix 
        {
          home-manager.extraSpecialArgs = { inherit nixvim; };    
        }
			];
		};
	};
}

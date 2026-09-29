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
    stylix.url = "github:nix-community/stylix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    ytm-player.url = "github:peternaame-boop/ytm-player";
	};

	outputs = { self, nixpkgs, home-manager, nixvim, stylix, zen-browser, ytm-player, ... }@inputs: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = { inherit inputs; };

			modules = [


        home-manager.nixosModules.home-manager
				./configuration.nix
        

        {
          home-manager.extraSpecialArgs = { inherit inputs; };  
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }
			];
		};
	};
}

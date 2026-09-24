{ config, pkgs, ... }:

{
  	services.displayManager.regreet = {
		enable = true;
		theme.name = "Adwaita";
		font = {
			name = "Cantarell";
			size = 16;
		};
	};
}

{ config, pkgs, nixvim, ... }:

{

	imports = [
    nixvim.homeModules.nixvim
		./neovim.nix
    ./waybar.nix
    ./hyprland.nix
    
	];
#  Home-Manager stuff
	home.username = "asapz";
	home.homeDirectory = "/home/asapz";
	
	home.stateVersion = "26.05";
	

#  dolphin
	home.file."${config.xdg.configHome}/dolphinrc".text = ''
		[Main View]
		HiddenFiles=true
	'';

	home.packages = with pkgs; [ 
		htop
		fastfetch
		kitty
		wofi
		firefox
	
	];
	
	programs.home-manager.enable = true;
}

{ config, pkgs, nixvim, ... }:

{

	imports = [
    nixvim.homeModules.nixvim
		./neovim.nix
    ./hyprland.nix
	];
#  Home-Manager stuff
	home.username = "asapz";
	home.homeDirectory = "/home/asapz";
	
	home.stateVersion = "26.05";
	
#Waybar
  programs.waybar = {
		enable = true;
		settings = {
			mainBar = {
				layer = "top";
				position = "top";
				modules-left = [ "hyprland/workspaces" "hyperland/submap" ];
				modules-center = [ "hyperland/window" ];
				modules-right = [ "battery" "clock" ];

				"hyprland/workspaces" = {
					format = "{name}";
					on-click = "activate";
				};
			};
		};
		systemd = {
			enable = true;
			targets = [ "hyprland-session.targets" ];
		};
		
	};

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

{ config, pkgs, nixvim, ... }:

{

	imports = [
    nixvim.homeModules.nixvim
		./neovim.nix
    ./waybar.nix
    ./hyprland.nix
    ./dolphin.nix
    ./bat.nix
    ./dunst.nix
    ./fastfetch.nix
    ./kitty.nix
	];
#  Home-Manager stuff
	home.username = "asapz";
	home.homeDirectory = "/home/asapz";
	
	home.stateVersion = "26.05";

  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
      ls = "ls -a --color=auto";
      network = "nmtui";
    };

    initExtra = "fastfetch";
  };

	home.packages = with pkgs; [ 
		htop
		fastfetch
		wofi
		firefox
	  fastfetch
	];
	
	programs.home-manager.enable = true;
}

{ config, pkgs, inputs, ... }:

{

	imports = [
		./neovim.nix
    ./stylix.nix
    ./waybar.nix
    ./hyprland.nix
    ./dolphin.nix
    ./bat.nix
    ./dunst.nix
    ./fastfetch.nix
    ./kitty.nix
    ./hyprlock.nix
    ./zen.nix
    ./ytm.nix
    ./cava.nix
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
      lava = "lavat -g -c d4af37 -k f3f7d5 -b 6 -r 3 -R 1 -s 7";
      nix = "cd /etc/nixos";
      cava = "kitten @ set-background-opacity 0.01 && hyprctl --batch 'keyword general:border_size = 0 ; keyword general:col.active_border rgba(00000000) ; keyword general:col.inactive_border rgba(00000000) ; keyword decoration:blur:enabled 0' && command cava && kitten @ set-background-opacity 0.6 && hyprctl --batch 'keyword general:border_size 2 ; keyword decoration:blur:enabled 1'";
    };

    initExtra = "fastfetch";
  };

  gtk = {
    enable = true;
    gtk4.extraCss = ''
        window.cavasik,
        window#io-github-thewisker-cavasik,
        window.main-window {
          background-colo: rgba(30, 30, 46, 0.5) !important;
          background: regba(30, 46, 0.5) !important;
        }

        windowbox, box, stack, grid {
          background-color: transparent !important;
          background: transparent !important;
        }
    '';
  };
	home.packages = with pkgs; [ 
		htop
		wofi
    gcc
    lavat
    mpv
    yt-dlp
    eduvpn-client
	];
	
	programs.home-manager.enable = true;
}

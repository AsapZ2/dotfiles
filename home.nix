{ config, pkgs, ... }:

{
#  Home-Manager stuff
	home.username = "asapz";
	home.homeDirectory = "/home/asapz";
	
	home.stateVersion = "26.05";
#  Wayland-Hyprland
	wayland.windowManager.hyprland = {
		enable = true;
		configType = "hyprlang";
		settings = {	
		#  Key Modifiers	
			"$Mod" = "SUPER";
		#  standard hyprland window scaling no clue
			monitor = ", preferred, auto, 1";

			env = [
				"GDK_SCALE,1"
				"MOZ_ENABLE_WAYLAND, 1"
				"XCURSOR_SIZE, 24"
			];

			xwayland = {
				force_zero_scaling = true;
			};
		#  Basic Shortcuts
			bind = [	
				"$Mod, Q, exec, kitty" # Open Kitty Terminal
				"$Mod, C, killactive," # Kill Active Window
				"$Mod, L, exit," # Win + L bak to login screen
				"$Mod, E, exec, dolphin" # Open File Manager
				"$Mod, R, exec, wofi --show drun" # Open Wofi App Launcher
			];	

		#Keyboard Input Layout
			input = {

				kb_layout = "de";
				kb_variant = "nodeadkeys";

			};

		# Styling	
			decoration = {
				rounding = 10;
				blur = {
					enabled = true;
					size = 3;
				};
			};
		};
	};
#  Waybar
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
			target = "hyprland-session.target";
		};
		
	};

#  dolphin
	home.file."${config.xdg.configHome}/dolphinrc".text = ''
		[Main View]
		HiddenFiles=true
	'';
# neovim
	programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # KATEGORIE A: Offiziell unterstützte Plugins (Einfache Aktivierung)
    plugins = {
      # 1. Dateibaum
      neo-tree.enable = true;

      # 2. Syntax Highlighting (Treesitter)
      treesitter.enable = true;

      # 3. Fuzzy Finder (Telescope)
      telescope = {
        enable = true;
        keymaps = {
          "<space>ff" = "find_files";
          "<space>fg" = "live_grep";
        };
      };

      # 4. Git-Integration
      gitsigns.enable = true;
    };

    # KATEGORIE B: Jedes andere Plugin aus Nixpkgs hinzufügen (ohne eigene Nixvim-Optionen)
    # Diese werden in den runtimepath (pack/*/start) injiziert
    extraPlugins = with pkgs.vimPlugins; [
   
    
    ];

    # KATEGORIE C: Plugins direkt von GitHub laden (völlig unabhängig von Nixpkgs)
    # Nützlich, wenn ein Plugin brandneu oder nicht in Nixpkgs verfügbar ist

    # Globaler Lua-Code (falls Sie noch traditionelle Konfigurationen beipacken wollen)
    extraConfigLua = ''
    
    '';
  };
};

	home.packages = with pkgs; [ 
		htop
		fastfetch
		kitty
		wofi
		firefox
	
	];
	
	programs.home-manager.enable = true;
}

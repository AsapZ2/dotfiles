{ pkgs, ... }:

{

	wayland.windowManager.hyprland = {
		enable = true;
		configType = "hyprlang";
		settings = {

    #  Start Waybar
      exec-once = [
      "waybar"
    ];

      general = {
        layout = "dwindle";
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
      };

      misc = {
        on_focus_under_fullscreen = 2;
      };

      dwindle = {
        preserve_split = true;
      };

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

}

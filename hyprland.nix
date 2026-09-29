{ pkgs, ... }:

{

	wayland.windowManager.hyprland = {
		enable = true;
		configType = "hyprlang";
		settings = {

    #  Start Waybar
      exec-once = [
      "waybar"
      "blueman-applet"
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
        "MOZ_E10S, 1"
        "MOZ_ALLOW_DOWNGRADED_TRANSPARENT_WINDOW, 1"
        "MOZ_EGL_NO_X11, 1"
			];

			xwayland = {
				force_zero_scaling = true;
			};
		#  Basic Shortcuts
			bind = [	
				"$Mod, Q, exec, kitty" # Open Kitty Terminal
				"$Mod, C, killactive," # Kill Active Window
				"$Mod, L, exec, hyprlock" # Win + L bak to login screen
				"$Mod, E, exec, dolphin" # Open File Manager
				"$Mod, R, exec, wofi --show drun" # Open Wofi App Launcher
			  "$Mod, N, workspace, empty"
      	"$Mod, period, workspace, e+1"

      ];

      bindel = [
        ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
      
      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
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

      windowrule = [
        "match:class ^(firefox)$, opaque 0"
      ];
		};
	};

}

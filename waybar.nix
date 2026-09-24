{ pkgs, ... }:

{
    
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

  }

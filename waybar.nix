{ pkgs, ... }:

{
    
programs.waybar = {
		enable = true;
		settings = {
			mainBar = {
				layer = "top";
				position = "top";
				modules-left = [ "hyprland/workspaces" "hyperland/submap" ];
				modules-center = [ "hyperland/window" "custom/launcher" ];
				modules-right = [ "bluetooth" "battery" "clock" ];

				"hyprland/workspaces" = {
					format = "{name}";
					on-click = "activate";
				};
        
        "custom/launcher" = {
        format = " ";
        on-click = "wofi --show drun";
        tooltip = false;
      };

        "battery" = {
            states = {
                warning = 30;
                critical = 15;
              };
            format = "{icon} {percentage}%";
            format-charging = " {percentage}%";
            format-plugged = " {percentage}%";
            format-icons = ["" "" "" "" ""];
          };

        "bluetooth" = {
          format = "{status}";
          format-disabled = " off";
          format-connected = "{num_connections}";
          tooltip-formati = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          on-click = "blueman-manager";
        };
			};

      
		};

    style = ''
    * {
      font-family: "JetBrainsMono Nerd Font", "Font Awesome 6 Free", sans-serif;
      font-size: 14px;
    }

    #custom-launcher {
      font-size: 18px;
      color: #7aa2f7;
    }

    #battery {
      color: #a9b1d6;
    }
    '';

		systemd = {
			enable = true;
			targets = [ "hyprland-session.targets" ];
		};
		
	};

  }

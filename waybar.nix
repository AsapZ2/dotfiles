{ config, pkgs, ... }:

let
  colors = {
      bg = "rgba(0, 0, 0, 0)";
      seam = "#EFBF04";
      text = "#FFFFFF";
    };
in

{
    
programs.waybar = {
		enable = true;
		settings = {
			mainBar = {
				layer = "top";
				position = "top";
				modules-left = [ "hyprland/workspaces" ];
				modules-center = [ "hyprland/window" "custom/launcher" ];
				modules-right = [ "bluetooth" "battery" "clock" ];

				"hyprland/workspaces" = {
					format = "{name}";
					on-click = "activate";
				};
       
        "hyprland/window" = {
          format = "{}";
          separate-outputs = true;
          rewrite = {
            "(.*) — Zen Browser" = " Zen";  
          };
        };
      

        "custom/launcher" = {
        format = " ";
        on-click = "wofi --show drun";
        tooltip = false;
      };

        "battery" = {
          bat = "BAT1";
          states = {
                warning = 30;
                critical = 15;
              };
            format = " {capacity}%";
            format-charging = "  {capacity}%";
            format-plugged = "󰂄 {capacity}%";
          };

        "bluetooth" = {
          format = " {status}";
          format-disabled = " off";
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
    
    window#waybar {
        background-color: ${colors.bg};
        color: ${colors.text};

        border-bottom: 2px dashed ${colors.seam};
      }

    #custom-launcher {
      font-size: 18px;
      color: #7aa2f7;
    }

    #battery {
      color: #40D04E;
    }
    '';

		systemd = {
			enable = true;
			targets = [ "hyprland-session.targets" ];
		};
		
	};

  }

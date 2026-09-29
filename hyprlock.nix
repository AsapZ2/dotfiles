{ pkgs, ... }:

{

    programs.hyprlock = {
      enable = true;

      settings = {

        background = {
              monitor = "";
              blur_passes = 2;
              blur_size = 7;
            };
        
        input-field = {
              monitor = "";
              size = "200, 50";
              position = "0, -50";
              halign = "center";
              valign = "center";
              outline_thickness = 3;
              dots_size = 0.33;
              dots_spacing = 0.15;
              fade_on_empty = false;
            };

        label = {
            monitor = "";
            text = "$TIME"; # Built-in variable for system time
            color = "rgba(200, 200, 200, 1.0)";
            font_size = 64;
            font_family = "sans-serif";
            position = "0, 100";
            halign = "center";
            valign = "center";
            };

        general = {
          disable_loading_bar = true;
          grace = 3;
          hide_cursor = true;
        };
      };
    };

  }

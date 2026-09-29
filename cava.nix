{ pkgs, ... }:
{
    programs.cava = {
        enable = true;
        settings = {
            general = {
                framerate = 60;
                bars = 0;
                bar_width = 2;
                bar_spacing = 1;
              };
            input = {
                method = "pipewire";
                source = "auto";
              };
            color = {
                gradient = 1;
                gradient_count = 2;
                gradient_color_1 = "'#d4af37'";
                gradient_color_2 = "'#e5c158'";
              };
          };
      };
  }

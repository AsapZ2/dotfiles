{ pkgs, ... }:

{

    services.dunst = {
      enable = true;
      settings = {
        global = {
          width = 300;
          height = 200;
          history_length = 20;
          font = "DejaVu Sans 10";
        };
        urgency_low = {
          background = "#222222";
          foreground = "#888888";
          timeout = 5;
        };
        urgency_normal = {
          background = "#285577";
          foreground = "#ffffff";
          timeout = 10;
        };
      };
    };

  }

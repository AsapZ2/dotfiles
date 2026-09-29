{ pkgs, ... }:

{

    services.dunst = {
      enable = true;
      settings = {
        global = {
          width = 300;
          height = 200;
          history_length = 20;
        };
        urgency_low = {
          timeout = 5;
        };
        urgency_normal = {
          timeout = 10;
        };
      };
    };

  }

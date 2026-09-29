{ pkgs, ... }:

{

    programs.kitty = {
      enable = true;

      extraConfig = ''
        background_opacity 0.5
        confirm_os_window_close -1
        remember_window_size no
        cursor_trail 1
        allow_remote_control yes
        listen_on unix:@mykitty
        dynamic_background_opacity yes
      '';
    };

  }

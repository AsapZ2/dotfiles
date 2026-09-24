{ pkgs, ... }:

{

  programs.fastfetch = {
    enable = true;
    settings = {
      disableLinewrap = true;
      logo = {
        source = "/home/asapz/Downloads/Clap Cheer GIF.gif";
        type = "kitty-icat";
        width = 32;
        height = 16;
        padding = {
          right = 4;
        };
      };
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "display"
        "de"
        "wm"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "break"
      ];
    };
  };  
  
  }

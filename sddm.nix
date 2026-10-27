{ pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    };  

  environment.systemPackages = with pkgs; [
    sddm-astronaut
  ];
}

{ pkgs, inputs, ... }:
{
  imports = [ 
    inputs.zen-browser.homeModules.default 
  ];

  programs.zen-browser = {
    
    enable = true;

    profiles.rice = {
    
    isDefault = true;
    
    settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.tabs.allow_transparent_browser" = true;
        "zen-widget.linux.transparency" = true;
        "zen.view.use-transparent-background" = true;
        "widget.allow-client-side-decoration" = true;
        "layers.acceleration.force-enabled" = true;
        "gfx.webrender.all" = true;
    };
    
    };
  };
}

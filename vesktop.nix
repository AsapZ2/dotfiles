{


  programs.vesktop = {
      enable = true;
      settings = {
          discordBranch = "stable";
          transparencyOption = "blur";
          autoStartMinimized = false;
          hardwareAcceleration = true;
      };
          vencord.settings = {
            autoUpdate = false;
            autoUpdateNotification = false;
            plugins = {
                MessageLogger = {
                enabled = true;
                ignoreSelf = true;
                };
              };
            useQuickCss = true;
            enableWindowTransparency = true;
          };
    };
}

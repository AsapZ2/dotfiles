{ pkgs, ... }: {

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.pkgs = pkgs;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
    };

    plugins = {
      treesitter.enable = true;
      lualine.enable = true;
      web-devicons.enable = true;

      telescope = {
        enable = true;
        keymaps = {
          "<space>ff" = "find_files";
          "<space>fg" = "live_grep";
        };
      };
    };

    extraConfigLua = ''
      print("Nixvim aus separater Datei geladen!")
    '';
  };
}

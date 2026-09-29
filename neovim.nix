{ pkgs, inputs, ... }: {
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.pkgs = pkgs;

    colorschemes.tokyonight = {
        enable = true;
        settings.style = "moon";
      };


    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      termguicolors = true;
    };

    globals.mapleader = ",";

    keymaps = [
      {
          mode = "v";
          key = "<leader>y";
          action = "\"+y";
          options = {
              desc = "Yank selection to system clipboard";
            };
        }
      {
          mode = "n";
          key = "<leader>p";
          action = "\"+p";
          options = {
              desc = "Paste from system clipboard";
            };
        }
         {
          mode = "n";
          key = "<leader>e";
          action = "<cmd>NeoTreeFocusToggle<CR>";
          options = {
              desc = "Toggle NeoTree";
            };
        }
    ];

    plugins = {
     
      
        telescope = {
        enable = true;
        keymaps = {
          "<space>ff" = "find_files";
          "<space>fg" = "live_grep";
        };
      };

      lualine.enable = true;
      bufferline.enable = true;
       treesitter.enable = true;
      web-devicons.enable = true;
      neo-tree.enable = true;
      which-key.enable = true;
      gitsigns.enable = true;
      treesitter-context.enable = true;

      lsp = {
          enable = true;

          servers = {
              nil_ls.enable = true;
              pyright.enable = true;
              ts_ls.enable = true;
              lua_ls.enable = true;
              clangd.enable = true;
            };
        };

        cmp = {
            enable = true;
            settings = { 
              sources = [
               { name = "nvim_lsp"; }
               { name = "path"; }
               { name = "buffer"; }

              ];

               mapping = {
              "<C-Space>" = "cmp.mapping.complete()";
              "<CR>" = "cmp.mapping.confirm({ select = true })";
              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })";
              "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })";
            };
          };

                
        };

        noice = {
          enable = true;
          settings = {
            cmdline.enabled = true;
          };
        };
    };
  };
}

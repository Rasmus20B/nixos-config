{
  self,
  pkgs,
  ...
}:

{
  programs.nixvim = {
    enable = true;
    opts = {
      relativenumber = true;
      shiftwidth = 2;
    };
    colorschemes.catppuccin.enable = true;
    plugins = {
      lualine.enable = true;
      lightline.enable = true;
      web-devicons.enable = true;
      barbar.enable = true;
      lsp = {
	enable = true;
	servers = {
	  lua_ls.enable = true;
	  rust_analyzer = {
	    enable = true;
	    installCargo = false;
	    installRustc = false;
	  };
	  clangd.enable = true;
	  nixd.enable = true;
	  #nix.enable = true;
	};
      };
      cmp = {
	enable = true;
	autoEnableSources = true;
	settings.sources = [
	  {name = "nvim_lsp";}
	  {name = "path";}
	  {name = "buffer";}
	];
      };
      neo-tree.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      luasnip.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      lazygit-nvim
      nvim-window-picker 
    ];

    extraConfigLua = ''
      require("telescope").load_extension("lazygit")
    '';

    globals.mapleader = " ";
    keymaps = [
      {
	mode = "n";
	key = "<leader>gg";
	action = "<cmd>LazyGit<CR>";
      }
      {
	mode = "n";
	key = "<leader>ff";
	action = "<cmd>Telescope find_files<CR>";
      }
      {
	mode = "n";
	key = "<leader>e";
	action = "<cmd>Neotree toggle<CR>";
      }
      {
	mode = "n";
	key = "<leader>lf";
	action = ''<cmd>lua vim.diagnostic.open_float()<CR>'';
      }

      # Buffers 
      {
	mode = "n";
	key = "<leader>x";
	action = "<cmd>BufferClose<CR>";
      }
      {
	mode = "n";
	key = "<tab>";
	action = "<cmd>BufferNext<CR>";
      }
      {
	mode = "n";
	key = "<S-tab>";
	action = "<cmd>BufferPrevious<CR>";
      }
    ];
  };
}

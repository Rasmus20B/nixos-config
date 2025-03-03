
{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      lualine.enable = true;
      lightline.enable = true;
      web-devicons.enable = true;
      barbar.enable = true;
      dap = {
        enable = true;
        extensions = {
          dap-ui.enable = true;
          dap-virtual-text.enable = true;
          dap-python.enable = true;
        };
        adapters = {
          executables = {gdb = {command = "gdb"; }; };
        };
      };
      lsp = {
	enable = true;
	servers = {
	  lua_ls.enable = true;
	  rust_analyzer = {
	    enable = true;
            settings = {
              diagnostics = {
                enabled = false;
              };
            };
	    installCargo = true;
	    installRustc = true;
	  };
	  clangd.enable = true;
	  nixd.enable = true;
	};
      };
      cmp = {
      	enable = true;
      	autoEnableSources = true;
      	settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
          ];

          mapping = {
            "<Tab>" =
              "cmp.mapping(
                cmp.mapping.select_next_item(
                  {behaviour = cmp.SelectBehavior.Select}
                ),
                {'i', 's'}
              )";
            "<CR>" =
              "cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
              }
            ";
            "<S-Tab>" =
              "cmp.mapping(
                cmp.mapping.select_prev_item(
                  {behaviour = cmp.SelectBehavior.Select}
                ),
                {'i', 's'}
              )";
          };
        };
      };
      neo-tree.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      luasnip.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      lazygit-nvim
      nvim-window-picker 
    ];

    extraConfigLua = ''
      require("telescope").load_extension("lazygit")
    '';
  };
}

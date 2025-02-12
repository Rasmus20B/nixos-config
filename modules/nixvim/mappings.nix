
{ ... }:
{
  programs.nixvim = {
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
      {
        mode = "n";
        key = "<leader>lh";
        action = "<cmd>lua vim.diagnostic.disable()<CR>";
      }
      {
        mode = "n";
        key = "<leader>le";
        action = "<cmd>lua vim.diagnostic.enable()<CR>";
      }
      {
        mode = "n";
        key = "<S-k>";
        action = ''<cmd>lua vim.lsp.buf.hover()<CR>'';
      }
      {
        mode = "n";
        key = "gd";
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
      }
      {
        mode = "n";
        key = "gr";
        action = "<cmd>lua vim.lsp.buf.references()<CR>";
      }
      {
        mode = "n";
        key = "<leader>fm";
        action = "<cmd>lua vim.lsp.buf.format()<CR>";
      }
      {
        mode = "n";
        key = "<leader>ra";
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
      }
    ];
  };
}


{ ... }:
{
  programs.nixvim = {
    enable = true;
    opts = {
      relativenumber = true;
      number = true;
      shiftwidth = 2;
      expandtab = true;
      cursorline = true;
      smartindent = true;
      smartcase = true;
      signcolumn = "number";
    };
    colorschemes.catppuccin.enable = true;
  };
}

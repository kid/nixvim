{
  # Import all your configuration modules here
  imports = [
    ./cmp.nix
    ./lsp.nix
    ./none-ls.nix
  ];

  globals = {
    mapleader = ",";
  };

  colorschemes.gruvbox.enable = true;

  plugins.lualine.enable = true;
  plugins.which-key.enable = true;
  plugins.treesitter.enable = true;
}

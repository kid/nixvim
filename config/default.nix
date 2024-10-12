self:
{ lib, ... }:
{
  _module.args = {
    localFlake = self;
  };

  # Import all your configuration modules here
  imports = [
    ./keys.nix
    ./autocommands.nix

    ./completion/blink-cmp.nix
    ./completion/friendly-snippets.nix
    ./completion/cmp.nix
    ./completion/copilot.nix
    ./completion/friendly-snippets.nix
    ./completion/lspkind.nix
    ./completion/luasnip.nix

    ./git/diffview.nix
    ./git/gitsigns.nix
    ./git/neogit.nix

    ./lsp/lsp.nix
    ./lsp/lsp-format.nix
    ./lsp/lspsaga.nix
    ./lsp/none-ls.nix
    ./lsp/trouble.nix

    ./coding/js.nix
    ./coding/go.nix
    ./coding/nix.nix
    ./coding/rust.nix
    ./coding/terraform.nix

    ./treesitter.nix

    ./ui/bufferline.nix
    ./ui/indent-blankline.nix
    ./ui/neo-tree.nix
    ./ui/noice.nix
    ./ui/flash.nix
    ./ui/smart-splits.nix
    ./ui/telescope.nix
    ./ui/which-key.nix
  ];

  performance = {
    byteCompileLua = {
      enable = true;
      nvimRuntime = true;
      configs = true;
      plugins = true;
    };
  };

  opts = {
    # Enable relative numbers
    number = true;
    relativenumber = true;

    # Set tabs to 2 spaces
    tabstop = 2;
    softtabstop = 2;
    showtabline = 2;
    expandtab = true;

    # Enable auto indenting and set it to spaces
    smartindent = true;
    shiftwidth = 2;

    # Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
    breakindent = true;

    # Incremental searching
    hlsearch = false;
    incsearch = true;

    # Enable text wrap
    wrap = true;

    # Better splitting
    splitbelow = true;
    splitright = true;

    # Faster completion
    updatetime = 50;

    # completeopt for cmp
    completeopt = [
      "menuone"
      "noselect"
      "noinsert"
    ];

    # Enable persistent undo history
    swapfile = false;
    autoread = true;
    backup = false;
    undofile = true;

    # Enable 24-bit colors
    termguicolors = true;

    # Only show command line when needed
    cmdheight = 0;

    cursorline = true;

    # Avoid jumps on first git change
    signcolumn = "yes";

    # remove the ~ tilde sign on the end of the file
    fillchars = {
      eob = " ";
    };

    showmode = false;

    # Reduce which-key timeout
    timeoutlen = 10;

    # Global status bar for all windows
    laststatus = 3;
  };

  globals = {
    mapleader = " ";
  };

  colorschemes.base16.enable = lib.mkDefault true;
  colorschemes.base16.colorscheme = lib.mkDefault "gruvbox-dark-medium";

  plugins.lualine.enable = true;
  plugins.web-devicons.enable = true;
  # plugins.schemastore = {
  #   enable = true;
  #   json.enable = true;
  #   yaml.enable = true;
  # };
  plugins.comment.enable = true;
  plugins.todo-comments.enable = true;
  plugins.nvim-surround.enable = true;
  plugins.nvim-autopairs.enable = true;
  plugins.dashboard.enable = true;

  # plugins.notify.enable = true;
  plugins.helm.enable = true;
  # TODO: tabout.nvim
  plugins.better-escape.enable = true;
}

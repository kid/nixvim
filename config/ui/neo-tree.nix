{ config, lib, ... }:
let
  helpers = lib.nixvim;
in
{
  plugins.neo-tree = {
    enable = true;
    filesystem = {
      followCurrentFile = {
        enabled = true;
        leaveDirsOpen = true;
      };
      filteredItems = {
        hideDotfiles = false;
      };
    };
  };

  keymaps = lib.mkIf config.plugins.neo-tree.enable [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
    }
  ];

  highlightOverride = lib.mkIf config.plugins.neo-tree.enable {
    NeoTreeGitAdded = {
      fg = helpers.mkRaw "require('base16-colorscheme').colors.base0B";
      bg = "none";
    };
    NeoTreeGitModified = {
      fg = helpers.mkRaw "require('base16-colorscheme').colors.base0D";
      bg = "none";
    };
  };
}

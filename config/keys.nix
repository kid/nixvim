{
  globals.mapleader = " ";

  keymaps = [
    # {
    #   mode = "i";
    #   key = "jk";
    #   action = "<ESC>";
    # }
    {
      mode = [
        "n"
        "i"
      ];
      key = "<C-s>";
      action = "<Esc><cmd>w<cr>";
    }
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>Neogit<cr>";
      options = {
        desc = "Neogit";
      };
    }
    {
      mode = "n";
      key = "[b";
      action = "<cmd>bprevious<cr>";
      options = {
        silent = true;
        desc = "Previous buffer";
      };
    }
    {
      mode = "n";
      key = "]b";
      action = "<cmd>bnext<cr>";
      options = {
        silent = true;
        desc = "Next buffer";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<Leader>y";
      action = "\"+y";
    }
    {
      mode = "n";
      key = "<Leader>Y";
      action = "\"+y$";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<Leader>p";
      action = "\"+p";
    }
    {
      mode = "n";
      key = "<Leader>P";
      action = "\"+P";
    }
  ];
}

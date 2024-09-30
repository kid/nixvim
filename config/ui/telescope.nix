{
  plugins.telescope = {
    enable = true;
    extensions = {
      file-browser = {
        enable = true;
      };
      ui-select = {
        enable = true;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope git_files<cr>";
      options = {
        desc = "Find files";
      };
    }
    {
      mode = "n";
      key = "<leader>fs";
      action = "<cmd>Telescope live_grep<cr>";
      options = {
        desc = "Live grep";
      };
    }
  ];
}

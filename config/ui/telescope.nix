{ config, lib, ... }:
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
    settings = {
      extensions = {
        ui-select = lib.nixvim.mkRaw ''
          {
            require('telescope.themes').get_dropdown()
          }
        '';
      };
    };
  };

  keymaps = lib.mkIf config.plugins.telescope.enable [
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope git_files<cr>";
      options.desc = "Find files";
    }
    {
      mode = "n";
      key = "<leader>fs";
      action = "<cmd>Telescope live_grep<cr>";
      options.desc = "Live grep";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<cr>";
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<cr>";
      options.desc = "Help tags";
    }
  ];
}

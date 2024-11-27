{
  config,
  lib,
  ...
}:
let
  helpers = lib.nixvim;
in
{
  plugins.gitsigns = {
    enable = true;
    settings.trouble = lib.mkIf config.plugins.trouble.enable true;
  };

  keymaps = lib.mkIf config.plugins.gitsigns.enable [
    {
      mode = "n";
      key = "[c";
      action = helpers.mkRaw ''
        function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            require('gitsigns').nav_hunk('prev')
          end
        end
      '';
      options.desc = "Next hunk";
    }
    {
      mode = "n";
      key = "]c";
      action = helpers.mkRaw ''
        function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            require('gitsigns').nav_hunk('next')
          end
        end
      '';
      options.desc = "Next hunk";
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = helpers.mkRaw ''
        function()
          require('gitsigns').blame_line()
        end
      '';
      options.desc = "Blame line";
    }
    {
      mode = "n";
      key = "<leader>gB";
      action = helpers.mkRaw ''
        function()
          require('gitsigns').blame()
        end
      '';
      options.desc = "Blame";
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = helpers.mkRaw ''
        function()
          require('gitsigns').stage_hunk()
        end
      '';
      options.desc = "Stage hunk";
    }
    {
      mode = "v";
      key = "<leader>gs";
      action = helpers.mkRaw ''
        function()
          require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v')})
        end
      '';
      options.desc = "Stage hunk";
    }
    {
      mode = "n";
      key = "<leader>gr";
      action = helpers.mkRaw ''
        function()
          require('gitsigns').reset_hunk()
        end
      '';
      options.desc = "Reset hunk";
    }
    {
      mode = "v";
      key = "<leader>gr";
      action = helpers.mkRaw ''
        function()
          require('gitsigns').reset_hunk({vim.fn.line('.'), vim.fn.line('v')})
        end
      '';
      options.desc = "Reset hunk";
    }
    {
      mode = "n";
      key = "<leader>gS";
      action = helpers.mkRaw ''
        function()
          require('gitsigns').stage_buffer()
        end
      '';
      options.desc = "Stage buffer";
    }
    {
      mode = "n";
      key = "<leader>gR";
      action = helpers.mkRaw ''
        function()
          require('gitsigns').reset_buffer()
        end
      '';
      options.desc = "Reset buffer";
    }
    {
      mode = "n";
      key = "<leader>gu";
      action = helpers.mkRaw ''
        function()
          require('gitsigns').undo_stage_hunk()
        end
      '';
      options.desc = "Undo stage hunk";
    }
  ];
}

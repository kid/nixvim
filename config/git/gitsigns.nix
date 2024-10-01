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
  ];
}

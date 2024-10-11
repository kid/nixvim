{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  helpers = lib.nixvim;
in
{
  extraPlugins = [
    inputs.blink-cmp.packages.${pkgs.system}.blink-cmp
  ];

  extraConfigLua = ''
    require("blink.cmp").setup({
      trigger = { signature_help = { enabled = true } },
      keymap = {
        accept = '<C-y>',
      },
      fuzzy = {
        prebuiltBinaries = {
          download = false,
        },
      },
      trigger = {
        signature_help = {
          enabled = true,
        },
      },
      nerd_font_variant = 'mono',
    })
  '';

  # FIXME: This should not be needed
  keymaps = [
    {
      mode = "i";
      key = "<Tab>";
      action = helpers.mkRaw ''
        function() 
          if vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
            return
          end
          return '<Tab>'
        end
      '';
    }
    {
      mode = "s";
      key = "<Tab>";
      action = helpers.mkRaw ''
        function() 
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        end
      '';
    }
    {
      mode = [
        "i"
        "s"
      ];
      key = "<S-Tab>";
      action = helpers.mkRaw ''
        function()
          if vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
            return
          end
          return '<S-Tab>'
        end
      '';
    }
  ];
}

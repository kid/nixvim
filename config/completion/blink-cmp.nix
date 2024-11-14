{ localFlake, pkgs, ... }:
{
  # TODO: Disable Copilot's ghost text when completion menu is visible?
  # TODO: Use <C-y> for both Copilot and blink.cmp

  extraPlugins = [
    localFlake.inputs.blink-cmp.packages.${pkgs.system}.blink-cmp
  ];

  extraConfigLua = ''
    local cmp = require("blink.cmp")
    cmp.setup({
      -- keymap = {
      --   accept = '<C-y>',
      --   snippet_forward = '<C-j>',
      --   snippet_backward = '<C-k>',
      --   -- NOTE: by default theses also incpude <Up> and <Down>, which then prevents from navigating Telescope's results
      --   select_prev = '<C-p>',
      --   select_next = '<C-n>',
      -- },
      fuzzy = {
        prebuiltBinaries = {
          download = false,
        },
      },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      trigger = {
        signature_help = {
          enabled = true,
        },
      },
      windows = {
        autocomplete = {
          -- draw = 'reversed',
          min_width = 50,
        },
        documentation = {
          auto_show = true,
        },
      },
      -- nerd_font_variant = 'mono',
    })

    -- TODO: waiting for https://github.com/Saghen/blink.cmp/pull/98
    -- cmp.on_open(function()
    --   require('copilot.suggestion').dismiss()
    --   vim.api.nvim_buf_set_var(0, 'copilot_suggestion_hidden', true)
    -- end)
    --
    -- cmp.on_close(function()
    --   vim.api.nvim_buf_set_var(0, 'copilot_suggestion_hidden', false)
    -- end)
  '';
}

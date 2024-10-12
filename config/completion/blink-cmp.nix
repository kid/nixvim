{ localFlake, pkgs, ... }:
{
  # TODO: Disable Copilot's ghost text when completion menu is visible?
  # TODO: Use <C-y> for both Copilot and blink.cmp

  extraPlugins = [
    localFlake.inputs.blink-cmp.packages.${pkgs.system}.blink-cmp
  ];

  extraConfigLua = ''
    require("blink.cmp").setup({
      trigger = { 
        signature_help = { 
          enabled = true 
        }, 
      },
      keymap = {
        accept = '<C-y>',
        -- NOTE: by default theses also incpude <Up> and <Down>, which then prevents from navigating Telescope's results
        select_prev = '<C-p>',
        select_next = '<C-n>',
      },
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
          draw = 'reversed',
          min_width = 50,
        },
        documentation = {
          auto_show = true,
        },
      },
      nerd_font_variant = 'mono',
    })

    -- # FIXME: attempt to index global 'ev' (a nil value)
    -- ev.on_load('copilot', function()
    --   vim.schedule(function() 
    --     local cmp = require('blink.cmp')
    --
    --     cmp.on_show(function()
    --       require('copilot').dismiss()
    --       vim.api.nvim_buf_set_var(0, 'copilot_suggestion_hidden', true)
    --     end)
    --
    --     cmp.on_hide(function()
    --       vim.api.nvim_buf_set_var(0, 'copilot_suggestion_hidden', false)
    --     end)
    --   end)
    -- end)
  '';
}

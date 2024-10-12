{ localFlake, pkgs, ... }:
{
  # TODO: Disable Copilot's ghost text when completion menu is visible
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
      },
      documentation = {
        auto_show = true,
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
}

{ inputs, pkgs, ... }:
{
  extraPlugins = [
    inputs.blink-cmp.packages.${pkgs.system}.blink-cmp
  ];

  # extraPlugins = with pkgs.vimUtils; [
  #   (buildVimPlugin {
  #     pname = "blink.cmp";
  #     version = "0.2.1";
  #     src = pkgs.fetchFromGitHub {
  #       owner = "Saghen";
  #       repo = "blink.cmp";
  #       rev = "526f786a8658f99dff36013b4e31d1f7e6b0a56b";
  #       hash = "sha256-apWKHEhXjFdS8xnSX0PoiOMzR+RVuYHFLV9sUl/HhTE=";
  #     };
  #   })
  # ];

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
}

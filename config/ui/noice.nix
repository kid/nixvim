{ config, ... }:
{
  plugins.noice = {
    enable = true;
    lsp = {
      signature.enabled = false;
      override = {
        "cmp.entry.get_documentation" = config.plugins.cmp.enable;
        "vim.lsp.util.convert_input_to_markdown_lines" = true;
        "vim.lsp.util.stylize_markdown" = true;
      };
    };
  };
}

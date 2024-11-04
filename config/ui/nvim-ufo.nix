{ config, lib, ... }:
{
  plugins = {
    nvim-ufo.enable = true;
    lsp.capabilities = lib.mkIf config.plugins.nvim-ufo.enable ''
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
    '';
  };

  opts = lib.mkIf config.plugins.nvim-ufo.enable {
    foldcolumn = "1";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;
  };

  keymaps = lib.mkIf config.plugins.nvim-ufo.enable [
    {
      mode = "n";
      key = "<Tab>";
      action = "za";
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "zA";
    }
  ];
}

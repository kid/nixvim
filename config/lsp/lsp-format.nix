{ config, lib, ... }:
{
  plugins.lsp-format.enable = true;

  keymaps = lib.mkIf config.plugins.lsp-format.enable [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>uf";
      action = "<cmd>FormatToggle<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
}

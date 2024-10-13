{ config, lib, ... }:
{
  plugins.trouble.enable = true;

  keymaps = lib.mkIf config.plugins.trouble.enable [
    {
      mode = "n";
      key = "<leader>ld";
      action = "<cmd>Trouble diagnostics<cr>";
      options.desc = "Show diagnostics (Trouble)";
    }
  ];
}

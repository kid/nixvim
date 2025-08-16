{ config, ... }:
{
  plugins.lspkind = {
    inherit (config.plugins.cmp) enable;
    settings = {
      cmp = {
        enable = true;
        max_width = 50;
      };
      symbol_map = {
        Copilot = "";
      };
    };
  };
}

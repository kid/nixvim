{ config, ... }:
{
  plugins.lspkind = {
    enable = config.plugins.cmp.enable;
    cmp = {
      enable = true;
      maxWidth = 50;
    };
    symbolMap = {
      Copilot = "";
    };
  };
}

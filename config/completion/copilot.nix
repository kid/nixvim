{ config, ... }:
{
  plugins.copilot-lua = {
    enable = true;
    settings.suggestion = {
      enabled = !config.plugins.cmp.enable;
      panel.enabled = false;
      autoTrigger = !config.plugins.cmp.enable;
    };
  };

  plugins.copilot-cmp = {
    inherit (config.plugins.cmp) enable;
  };
}

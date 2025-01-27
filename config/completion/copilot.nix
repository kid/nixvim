{ config, ... }:
{
  plugins.copilot-lua = {
    enable = true;
    panel.enabled = false;
    settings.suggestion = {
      enabled = !config.plugins.cmp.enable;
      autoTrigger = !config.plugins.cmp.enable;
    };
  };

  plugins.copilot-cmp = {
    enable = config.plugins.cmp.enable;
  };
}

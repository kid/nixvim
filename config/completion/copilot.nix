{ config, ... }:
{
  plugins.copilot-lua = {
    enable = true;
    panel.enabled = false;
    suggestion.enabled = !config.plugins.cmp.enable;
    suggestion.autoTrigger = !config.plugins.cmp.enable;
  };

  plugins.copilot-cmp = {
    enable = config.plugins.cmp.enable;
  };
}

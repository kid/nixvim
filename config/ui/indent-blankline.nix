{ config, ... }:
{
  plugins.indent-blankline = {
    enable = !config.plugins.snacks.settings.indent.enabled;
    settings = {
      scope.enabled = false;
      exclude = {
        filetypes = [
          ""
          "dashboard"
        ];
      };
    };
  };
}

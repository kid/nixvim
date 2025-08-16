{ pkgs, ... }:
{
  plugins.codecompanion = {
    enable = true;
    package = pkgs.vimPlugins.codecompanion-nvim.overrideAttrs {
      # NOTE: the following check fils on aarch64-darwin
      # - codecompanion.providers.actions.fzf_lua
      doCheck = false;
    };
    settings = {
      display.action_palette.provider = "snacks";
    };
  };
}

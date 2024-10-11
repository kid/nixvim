{ config, pkgs, ... }:
{
  plugins.luasnip = {
    enable = config.plugins.cmp.enable;
    settings = {
      enable_autosnippets = true;
    };
    fromVscode = [
      {
        lazyLoad = true;
        paths = "${pkgs.vimPlugins.friendly-snippets}";
      }
    ];
  };
}

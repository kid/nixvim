{ config, lib, ... }:
{
  plugins = {
    lsp.servers = {
      ts-ls.enable = true;
      eslint.enable = true;
    };

    none-ls.sources = lib.mkIf config.plugins.none-ls.enable {
      formatting = {
        prettierd.enable = true;
      };
    };
  };
}

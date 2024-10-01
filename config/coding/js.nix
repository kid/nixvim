{ config, lib, ... }:
{
  plugins = {
    lsp.servers = {
      eslint.enable = true;
      ts-ls.enable = true;
    };

    none-ls.sources = lib.mkIf config.plugins.none-ls.enable {
      formatting = {
        prettierd.enable = true;
      };
    };
  };
}

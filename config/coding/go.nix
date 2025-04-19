{
  config,
  lib,
  pkgs,
  ...
}:
{
  plugins = {
    # TODO: enable golangci-lint-ls?

    lsp.servers.gopls = {
      enable = true;
    };

    none-ls.sources = lib.mkIf config.plugins.none-ls.enable {
      formatting = {
        gofmt.enable = true;
        goimports_reviser = {
          enable = true;
          settings.extra_args = [
            "-rm-unused"
            "-set-alias"
          ];
        };
      };
    };
  };
}

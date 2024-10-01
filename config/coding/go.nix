{
  config,
  lib,
  pkgs,
  ...
}:
{
  plugins = {
    lsp.servers.gopls = {
      enable = true;
      goPackage = pkgs.go_1_23;
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

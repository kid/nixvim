{
  config,
  lib,
  pkgs,
  ...
}:
{
  plugins = {
    lsp.servers = {
      nil_ls.enable = true;
      nixd.enable = true;
      statix.enable = true;
    };

    none-ls.sources = lib.mkIf config.plugins.none-ls.enable {
      code_actions.statix.enable = true;

      diagnostics = {
        deadnix.enable = true;
        statix.enable = true;
      };

      formatting = {
        nixfmt = {
          enable = true;
          package = pkgs.nixfmt-rfc-style;
        };

        treefmt.enable = true;
      };
    };
  };
}

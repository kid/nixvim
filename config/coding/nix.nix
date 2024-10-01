{
  config,
  lib,
  pkgs,
  ...
}:
{
  plugins = {
    lsp.servers = {
      nil-ls.enable = true;
      nixd.enable = true;
    };

    none-ls.sources = lib.mkIf config.plugins.none-ls.enable {
      code_actions.statix.enable = true;

      formatting.nixfmt = {
        enable = true;
        package = pkgs.nixfmt-rfc-style;
      };
    };
  };
}

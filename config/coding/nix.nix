{
  config,
  lib,
  pkgs,
  ...
}:
{
  plugins = {
    conform-nvim.settings = lib.mkIf config.plugins.conform-nvim.enable {
      formatters_by_ft.nix = [ "nixfmt" ];
      formatters.nixfmt.command = lib.getExe pkgs.nixfmt-rfc-style;
    };

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

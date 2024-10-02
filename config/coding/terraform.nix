{
  config,
  lib,
  pkgs,
  ...
}:
let
  tfPkg = pkgs.opentofu;
in
{
  plugins = {
    lsp.servers.terraformls.enable = true;

    none-ls.sources = lib.mkIf config.plugins.none-ls.enable {

      diagnostics.terraform_validate = {
        # FIXME: does not work with opentofu
        enable = false;
        package = tfPkg;
      };

      formatting.opentofu_fmt = {
        enable = true;
      };
    };
  };
}

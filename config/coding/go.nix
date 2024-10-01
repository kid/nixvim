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

    conform-nvim.settings = lib.mkIf config.plugins.conform-nvm.enable {
      formatters_by_ft.go = [
        "gofmt"
        "goimports-reviser"
      ];

      formatters = {
        goimports-reviser.command = lib.getExe pkgs.goimports-reviser;
        goimports-reviser.args = lib.mkForce [
          "-rm-unused"
          "-set-alias"
          "-format"
          "$FILENAME"
        ];
      };
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

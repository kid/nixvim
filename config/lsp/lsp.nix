{ pkgs, ... }:
{
  plugins.lsp = {
    enable = true;
    servers = {
      nil-ls.enable = true;
      nixd.enable = true;
      jsonls.enable = true;
      yamlls.enable = true;
      gopls = {
        enable = true;
        goPackage = pkgs.go_1_23;
      };
      # golangci-lint-ls.enable = true;
      terraformls.enable = true;
    };
    # keymaps = {
    #   lspBuf = {
    #     "<leader>la" = {
    #       action = "code_action";
    #     };
    #   };
    # };
  };
  plugins.lsp-format.enable = true;
}

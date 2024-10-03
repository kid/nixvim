{ pkgs, ... }:
{
  plugins.lsp = {
    enable = true;
    servers = {
      # jsonls.enable = true;
      # yamlls.enable = true;
      # helm-ls.enable = true;
      # golangci-lint-ls.enable = true;
      # terraformls.enable = true;
    };
    # keymaps = {
    #   lspBuf = {
    #     "<leader>la" = {
    #       action = "code_action";
    #     };
    #   };
    # };
  };

  diagnostics = {
    virtual_text.prefix = "";
    signs.text = [
      "󰅙"
      ""
      "󰋼"
      "󰌵"
    ];
    underline = true;
    float.border = "single";
  };
}

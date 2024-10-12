{
  config,
  lib,
  ...
}:
{
  plugins.lsp = {
    enable = true;
    inlayHints = true;
    keymaps = {
      lspBuf =
        {
          "gd" = {
            action = "definition";
            desc = "Go to definition";
          };
          "gD" = {
            action = "references";
            desc = "Go to references";
          };
          "gi" = {
            action = "implementation";
            desc = "Go to implementation";
          };
          "gt" = {
            action = "type_definition";
            desc = "Go to type definition";
          };
        }
        // lib.mkIf (!config.plugins.lspsaga.enable) {
          "<leader>la" = {
            action = "code_action";
            desc = "Code actions";
          };
          "K" = {
            action = "hover";
            desc = "Show hover";
          };
        };

      diagnostic = {
        "[d" = {
          action = "goto_prev";
          desc = "Previous diagnostic";
        };
        "]d" = {
          action = "goto_next";
          desc = "Next diagnostic";
        };
      };
    };
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

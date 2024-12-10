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
          # "gd" = {
          #   action = "definition";
          #   desc = "Go to definition";
          # };
          # "gD" = {
          #   action = "references";
          #   desc = "Go to references";
          # };
          # "gi" = {
          #   action = "implementation";
          #   desc = "Go to implementation";
          # };
          # "gt" = {
          #   action = "type_definition";
          #   desc = "Go to type definition";
          # };
          # "<leader>lr" = {
          #   action = "rename";
          #   desc = "Rename";
          # };
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

  # FIXME: figure out why this does not work when set in `plugins.lsp.keymaps.lspBuf`
  keymapsOnEvents.LspAttach = [
    {
      mode = "n";
      key = "<leader>lr";
      action = "<cmd>lua vim.lsp.buf.rename()<CR>";
      options = {
        desc = "Rename";
        silent = true;
      };
    }
    {
      key = "gd";
      action = "<cmd>lua vim.lsp.buf.definition()<cr>";
      options.desc = "Go to definition";
    }
    {
      key = "gD";
      action = "<cmd>lua vim.lsp.buf.references()<cr>";
      options.desc = "Go to references";
    }
    {
      key = "gi";
      action = "<cmd>lua vim.lsp.buf.implementation()<cr>";
      options.desc = "Go to implementation";
    }
    {
      key = "gt";
      action = "<cmd>lua vim.lsp.buf.type_definition()<cr>";
      options.desc = "Go to type definition";
    }
  ];

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

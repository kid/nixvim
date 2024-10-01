{ config, lib, ... }:
{
  plugins.none-ls = {
    enable = true;

    sources = {
      code_actions = {
        # gitsigns.enable = lib.mkIf config.plugins.gitsigns.enable true;
        gitsigns.enable = true;
      };
      #   diagnostics = {
      #     yamllint.enable = true;
      #   };
      #   formatting = {
      #     stylua.enable = true;
      #     # yamlfmt.enable = true;
      #     hclfmt.enable = true;
      #     opentofu_fmt.enable = true;
      #     treefmt.enable = true;
      #     nixfmt.enable = true;
      #     nixfmt.package = pkgs.nixfmt-rfc-style;
      #   };
    };
  };

  keymaps = lib.mkIf (config.plugins.none-ls.enable) [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>lf";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
}

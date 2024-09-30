{ pkgs, ... }:
{
  plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    settings = {
      updateInInsert = false;
    };
    sources = {
      diagnostics = {
        yamllint.enable = true;
      };
      formatting = {
        stylua.enable = true;
        # yamlfmt.enable = true;
        hclfmt.enable = true;
        opentofu_fmt.enable = true;
        treefmt.enable = true;
        nixfmt.enable = true;
        nixfmt.package = pkgs.nixfmt-rfc-style;
      };
    };
  };
  keymaps = [
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

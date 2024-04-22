{
  plugins.lsp = {
    enable = true;
    servers = {
      nil_ls.enable = true;
      nixd.enable = true;
    };
  };
  plugins.lsp-format.enable = true;
}

{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "stay-centered";
      src = pkgs.fetchFromGitHub {
        owner = "arnamak";
        repo = "stay-centered.nvim";
        rev = "e1a63ccaf2584e97c0ef8e64f9654c9a80d983f6";
        sha256 = "sha256-TIiv0pwBkwn7n1JFVqgcruKZ69OdxdEId4ca+M5hZ9k=";
      };
    })
  ];

  extraConfigLua = ''
    require("stay-centered").setup()
  '';
}

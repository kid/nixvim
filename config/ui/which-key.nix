{ lib, ... }:
let
  helpers = lib.nixvim;
in
{
  plugins.which-key = {
    enable = true;
    settings = {
      spec = [
        ((helpers.listToUnkeyedAttrs [ "<leader>f" ]) // { group = "Find"; })
        ((helpers.listToUnkeyedAttrs [ "<leader>l" ]) // { group = "LSP"; })
        ((helpers.listToUnkeyedAttrs [ "<leader>g" ]) // { group = "Git"; })
      ];
    };
  };
}

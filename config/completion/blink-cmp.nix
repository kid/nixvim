{ lib, ... }:
let
  inherit (lib.nixvim) listToUnkeyedAttrs mkRaw;
in
{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      completion = {
        documentation = {
          auto_show = true;
        };
        menu = {
          min_width = 50;
          draw = {
            # We don't need label_description now because label and label_description are already
            # combined together in label by colorful-menu.nvim.
            columns = [
              (listToUnkeyedAttrs [ "kind_icon" ])
              ((listToUnkeyedAttrs [ "label" ]) // { gap = 1; })
            ];

            components = {
              label = {
                text = mkRaw ''
                  function (ctx)
                    return require("colorful-menu").blink_components_text(ctx)
                  end
                '';
                highlight = mkRaw ''
                  function (ctx)
                    return require("colorful-menu").blink_components_highlight(ctx)
                  end
                '';
              };
            };
          };
        };
      };
      signature = {
        enabled = true;
      };
    };
  };

  plugins.colorful-menu.enable = true;
}

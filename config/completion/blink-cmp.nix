{ lib, ... }:
let
  inherit (lib.nixvim) listToUnkeyedAttrs mkRaw;
in
{
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
            "avante_commands"
            "avante_files"
            "avante_mentions"
          ];
          providers = {
            avante_commands = {
              name = "avante_commands";
              module = "blink.compat.source";
              score_offset = 90;
              opts = { };
            };
            avante_files = {
              name = "avante_files";
              module = "blink.compat.source";
              score_offset = 100;
              opts = { };
            };
            avante_mentions = {
              name = "avante_mentions";
              module = "blink.compat.source";
              score_offset = 1000;
              opts = { };
            };
          };
          per_filetype.codecompanion = [ "codecompanion" ];
        };
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

    blink-compat.enable = true;

    colorful-menu.enable = true;
  };
}

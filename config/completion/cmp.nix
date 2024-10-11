{ config, lib, ... }:
let
  helpers = lib.nixvim;
in
{
  plugins = {
    cmp = {
      enable = false;
      settings = {
        autoEnableSources = false;

        experimental = {
          ghost_text = false;
        };

        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';

        sources = [
          { name = "nvim_lsp"; }
          # { name = "nvim_lsp_signature_help"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "path"; }
          { name = "emoji"; }
          { name = "nvim_lua"; }
          { name = "copilot"; }
        ];

        mapping = helpers.mkRaw ''
          cmp.mapping.preset.insert({
            ["<C-y>"] = {
              i = cmp.mapping.confirm({ select = true }),
            },
            ["<C-l>"] = cmp.mapping(function(fallback)
              local luasnip = require("luasnip")
              if luasnip.locally_jumpable(1) then
                luasnip.jump(1)
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<C-h>"] = cmp.mapping(function(fallback)
              local luasnip = require("luasnip")
              if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),
          })
        '';

        # window = {
        #   completion = {
        #     scrollbar = false;
        #     side_padding = 1;
        #     winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None,FloatBorder:CmpBorder";
        #     border = "none";
        #   };
        #
        #   documentation = {
        #     border = "single";
        #     winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder";
        #   };
        # };

        # window = {
        #   completion = {
        #     border = "single";
        #   };
        #   documentation = {
        #     border = "single";
        #   };
        # };
      };

      cmdline = {
        "/" = {
          mapping = helpers.mkRaw "cmp.mapping.preset.cmdline()";
          sources = [ { name = "buffer"; } ];
        };
        "?" = {
          mapping = helpers.mkRaw "cmp.mapping.preset.cmdline()";
          sources = [ { name = "buffer"; } ];
        };
        ":" = {
          mapping = helpers.mkRaw "cmp.mapping.preset.cmdline()";
          sources = [
            { name = "path"; }
            { name = "cmdline"; }
            { name = "cmdline_history"; }
            { name = "buffer"; }
            # { name = "nvim_lsp_document_symbol"; }
          ];
        };
      };
    };

    cmp-emoji.enable = config.plugins.cmp.enable;
    cmp-nvim-lsp.enable = config.plugins.cmp.enable;
    # cmp-nvim-lsp-document-symbol.enable = config.plugins.cmp.enable;
    # cmp-nvim-lsp-signature-help.enable = config.plugins.cmp.enable;
    cmp-nvim-lua.enable = config.plugins.cmp.enable;
    cmp-path.enable = config.plugins.cmp.enable;
    cmp-buffer.enable = config.plugins.cmp.enable;
    cmp-cmdline.enable = config.plugins.cmp.enable;
    cmp-cmdline-history.enable = config.plugins.cmp.enable;
    cmp_luasnip.enable = config.plugins.cmp.enable;
  };
}

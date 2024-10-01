let
  commonMappings = {
    "<C-n>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
    "<C-p>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })";
    "<C-y>" = "cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })";
    "<C-S-y>" = "cmp.mapping.confirm({ select = true })";
    "<C-Space>" = "cmp.mapping.complete()";
  };
in
{
  plugins = {
    cmp = {
      enable = true;
      settings = {
        autoEnableSources = false;

        experimental = {
          ghost_text = true;
        };

        snippet.expand = "luasnip";

        sources = [
          { name = "nvim_lsp"; }
          { name = "nvim_lsp_signature_help"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "path"; }
          { name = "luasnip"; }
          { name = "nvim_lua"; }
          { name = "copilot"; }
        ];

        mapping = commonMappings // {

          "<C-l>" = ''
            cmp.mapping(function(fallback)
              local luasnip = require("luasnip")
              if luasnip.locally_jumpable(1) then
                luasnip.jump(1)
              else
                fallback()
              end
            end, { "i", "s" })
          '';
          "<C-h>" = ''
            cmp.mapping(function(fallback)
              local luasnip = require("luasnip")
              if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" })
          '';
        };

        # window = {
        #   completion = {
        #     border = "solid";
        #   };
        #   documentation = {
        #     border = "solid";
        #   };
        # };
      };

      cmdline = {
        "/" = {
          mapping = commonMappings;
          sources = [ { name = "buffer"; } ];
        };
        ":" = {
          mapping = commonMappings;
          sources = [
            { name = "path"; }
            { name = "cmdline"; }
            { name = "cmdline_history"; }
            { name = "buffer"; }
            { name = "nvim_lsp_document_symbol"; }
          ];
        };
      };
    };

    cmp-nvim-lsp.enable = true;
    cmp-nvim-lsp-document-symbol.enable = true;
    cmp-nvim-lsp-signature-help.enable = true;
    cmp-nvim-lua.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
    cmp-cmdline.enable = true;
    cmp-cmdline-history.enable = true;
    cmp_luasnip.enable = true;
  };
}

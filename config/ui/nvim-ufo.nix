{ config, lib, ... }:
let
  helpers = lib.nixvim;
in
{
  plugins = {
    nvim-ufo = {
      enable = true;
      settings = {
        # enable_get_fold_virt_text = true;
        # fold_virt_text_handler = helpers.mkRaw ''
        #   function(virtText, lnum, endLnum, width, truncate)
        #       local newVirtText = {}
        #       local suffix = (' 󰁂 %d '):format(endLnum - lnum)
        #       local sufWidth = vim.fn.strdisplaywidth(suffix)
        #       local targetWidth = width - sufWidth
        #       local curWidth = 0
        #       for _, chunk in ipairs(virtText) do
        #           local chunkText = chunk[1]
        #           local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        #           if targetWidth > curWidth + chunkWidth then
        #               table.insert(newVirtText, chunk)
        #           else
        #               chunkText = truncate(chunkText, targetWidth - curWidth)
        #               local hlGroup = chunk[2]
        #               table.insert(newVirtText, {chunkText, hlGroup})
        #               chunkWidth = vim.fn.strdisplaywidth(chunkText)
        #               -- str width returned from truncate() may less than 2nd argument, need padding
        #               if curWidth + chunkWidth < targetWidth then
        #                   suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
        #               end
        #               break
        #           end
        #           curWidth = curWidth + chunkWidth
        #       end
        #       table.insert(newVirtText, {suffix, 'MoreMsg'})
        #       return newVirtText
        #   end
        # '';
      };
    };

    lsp.capabilities = lib.mkIf config.plugins.nvim-ufo.enable ''
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
    '';
  };

  opts = lib.mkIf config.plugins.nvim-ufo.enable {
    foldcolumn = "1";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;
    # fillchars = {
    #   eob = " ";
    #   fold = " ";
    #   foldopen = "";
    #   foldsep = " ";
    #   foldclose = "";
    # };
  };

  keymaps = lib.mkIf config.plugins.nvim-ufo.enable [
    {
      mode = "n";
      key = "<Tab>";
      action = "za";
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "zA";
    }
  ];

  autoCmd = lib.mkIf config.plugins.nvim-ufo.enable [
    {
      event = "FileType";
      pattern = [ "neo-tree" ];
      callback = helpers.mkRaw ''
        function()
          require("ufo").detach()
          vim.opt_local.foldenable = false
          -- FIXME: not working
          vim.opt_local.foldcolumn = "0"
        end
      '';
    }
  ];
}

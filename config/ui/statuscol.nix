{ lib, config, ... }:
let
  helpers = lib.nixvim;
in
{
  plugins.statuscol = {
    enable = !config.plugins.snacks.settings.statuscolumn.enabled;
    settings = {
      ft_ignore = [
        "neo-tree"
        "DiffviewFiels"
      ];
      relculright = true;
      segments = [
        {
          text = [
            (helpers.mkRaw "require('statuscol.builtin').foldfunc")
            " "
          ];
          click = "v:lua.ScFa";
        }
        {
          sign = {
            name = [ "diagnistic/signs" ];
            maxwidth = 2;
            auto = true;
          };
          click = "v:lua.ScSa";
        }
        {
          text = [ "%s" ];
          click = "v:lua.ScSa";
        }
        {
          text = [
            (helpers.mkRaw "require('statuscol.builtin').lnumfunc")
            " "
          ];
          click = "v:lua.ScLa";
        }
        # {
        #   sign = {
        #     namespace = [ "gitsigns" ];
        #     colwidth = 1;
        #     wrap = true;
        #   };
        #   click = "v:lua.ScSa";
        # }
        # {
        #   sign = {
        #     name = [ ".*" ];
        #     maxwidth = 2;
        #     colwidth = 1;
        #     auto = true;
        #     wrap = true;
        #   };
        #   click = "v:lua.ScSa";
        # }
      ];
    };
  };
}

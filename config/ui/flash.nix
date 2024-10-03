{ config, lib, ... }:
{
  plugins.flash.enable = true;

  keymaps = lib.mkIf config.plugins.flash.enable [
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "s";
      action = "<cmd>lua require('flash').jump()<cr>";
      options = {
        desc = "Flash";
      };
    }
    # FIXME: conflict with nvim-surround C-s in visual 🤔 
    # {
    #   mode = [
    #     "n"
    #     "x"
    #     "o"
    #   ];
    #   key = "S";
    #   action = "<cmd>lua require('flash').treesitter()<cr>";
    #   options = {
    #     desc = "Flash Treesitter";
    #   };
    # }
    {
      mode = "o";
      key = "r";
      action = "<cmd>lua require('flash').remote()<cr>";
      options = {
        desc = "Remote Flash";
      };
    }
  ];
}

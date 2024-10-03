{ config, lib, ... }:
{
  plugins.neo-tree = {
    enable = true;
    filesystem.followCurrentFile = {
      enabled = true;
      leaveDirsOpen = true;
    };
  };

  keymaps = lib.mkIf config.plugins.neo-tree.enable [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
    }
  ];
}

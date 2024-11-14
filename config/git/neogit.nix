{ config, lib, ... }:
{
  plugins.neogit = {
    enable = true;
    settings = {
      integrations = {
        diffview = lib.mkIf config.plugins.diffview.enable true;
        telescope = lib.mkIf config.plugins.telescope.enable true;
      };
      kind = "auto";
      signs =
        let
          signs = [
            ""
            ""
          ];
        in
        {
          item = signs;
          section = signs;
        };
    };
  };
}

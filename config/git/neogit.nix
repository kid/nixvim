{ config, lib, ... }:
{
  plugins.neogit = {
    enable = true;
    settings = {
      integration.diffview = lib.mkIf config.plugins.diffview.enable true;
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

{
  localFlake,
  lib,
  pkgs,
  ...
}:
let
  helpers = lib.nixvim;
  opts = {
    fuzy.prebuiltBinaries.download = false;
    completion = {
      accept.auto_brackets.enabled = true;
      menu.min_width = 50;
      documentation.auto_show = true;
    };
    signature.enabled = true;
  };
in
{
  # TODO: Disable Copilot's ghost text when completion menu is visible?
  # TODO: Use <C-y> for both Copilot and blink.cmp

  extraPlugins = [
    localFlake.inputs.blink-cmp.packages.${pkgs.system}.blink-cmp
  ];

  extraConfigLua = ''
    local cmp = require("blink.cmp")
    cmp.setup(${helpers.toLuaObject opts})
  '';
}

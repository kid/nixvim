{ config, lib, ... }:
let
  helpers = lib.nixvim;
in
{
  plugins.snacks = {
    enable = true;
    settings = {
      indent.enabled = true;
      statuscolumn.enabled = true;
      # TODO: need configuration
      toggle.enabled = true;
      styles.float.backdrop = false;
    };
  };

  keymaps = lib.mkIf config.plugins.snacks.enable [
    # Top pickers
    {
      mode = "n";
      key = "<leader><leader>";
      action = helpers.mkRaw "function() Snacks.picker.smart() end";
      options.desc = "Smart Find Files";
    }
    {
      mode = "n";
      key = "<leader>,";
      action = helpers.mkRaw "function() Snacks.picker.buffers() end";
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<leader>/";
      action = helpers.mkRaw "function() Snacks.picker.grep() end";
      options.desc = "Grep";
    }
    # Find
    {
      mode = "n";
      key = "<leader>ff";
      action = helpers.mkRaw "function() Snacks.picker.files() end";
      options.desc = "Find Files";
    }
    # Search
    {
      mode = "n";
      key = "<leader>fh";
      action = helpers.mkRaw "function() Snacks.picker.help() end";
      options.desc = "Help tags";
    }
    # LSP
    {
      mode = "n";
      key = "<leader>s";
      action = helpers.mkRaw "function() Snacks.picker.lsp_symbols() end";
      options.desc = "LSP Symbols";
    }
  ];
}

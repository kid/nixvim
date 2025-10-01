{ config, lib, ... }:
{
  plugins.lspsaga = {
    enable = true;
    settings = {
      beacon = {
        enable = true;
      };
      ui = {
        border = "rounded"; # One of none, single, double, rounded, solid, shadow
        codeAction = "💡"; # Can be any symbol you want 💡
      };
      hover = {
        openCmd = "!floorp"; # Choose your browser
        openLink = "gx";
      };
      diagnostic = {
        borderFollow = true;
        diagnosticOnlyCurrent = false;
        showCodeAction = true;
      };
      symbolInWinbar = {
        enable = true; # Breadcrumbs
      };
      codeAction = {
        extendGitSigns = true;
        showServerName = true;
        onlyInCursor = true;
        numShortcut = true;
        keys = {
          exec = "<CR>";
          quit = [
            "<Esc>"
            "q"
          ];
        };
      };
      lightbulb = {
        enable = false;
        sign = false;
        virtualText = true;
      };
    };
  };

  keymapsOnEvents = lib.mkIf config.plugins.lspsaga.enable {
    LspAttach = [
      {
        mode = "n";
        key = "<leader>ll";
        action = "<cmd>Lspsaga show_line_diagnostics<CR>";
        options = {
          desc = "Show line diagnostics";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>la";
        action = "<cmd>Lspsaga code_action<CR>";
        options = {
          desc = "Code actions";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "K";
        action = "<cmd>Lspsaga hover_doc<CR>";
        options.desc = "Show hover";
      }
    ];
  };
}

{ inputs }:
final: prev:
with final.pkgs.lib;
let
  pkgs = final;

  # Make sure we use the pinned nixpkgs instance for wrapNeovimUnstable,
  # otherwise it could have an incompatible signature when applying this overlay.
  pkgs-locked = inputs.nixpkgs.legacyPackages.${pkgs.system};

  mkNeovim = pkgs.callPackage ./mkNeovim.nix {
    inherit (pkgs-locked) neovimUtils wrapNeovimUnstable;
  };

  plugins = [ ];

  extraPackages = with pkgs; [
    lua-language-server
    nil
  ];
in
{
  # This is the neovim derivation
  # returned by the overlay
  nvim-pkg = mkNeovim {
    inherit extraPackages plugins;
  };

  # This is meant to be used within a devshell.
  # Instead of loading the lua Neovim configuration from
  # the Nix store, it is loaded from $XDG_CONFIG_HOME/nvim-dev
  nvim-dev = mkNeovim {
    inherit extraPackages plugins;
    appName = "nvim-dev";
    wrapRc = false;
  };
}

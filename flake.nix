{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim.url = "github:nix-community/nixvim";
    gen-luarc.url = "github:mrcjkb/nix-gen-luarc-json";
  };

  outputs =
    { flake-parts, ... }@inputs:
    let
      neovim-overlay = import ./nix/neovim-overlay.nix { inherit inputs; };
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      # debug = true;

      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      imports = [
        ./nixvim.nix
      ];

      perSystem =
        { pkgs, system, ... }:
        {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [
              neovim-overlay
              inputs.gen-luarc.overlays.default
            ];
          };

          devShells.default = pkgs.mkShell {
            name = "nvim-devShell";
            buildInputs = with pkgs; [
              lua-language-server
              nil
              stylua
              luajitPackages.luacheck
              nvim-dev
            ];
          };
        };
    };
}

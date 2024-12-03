{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/e6944db042eb6a652debbff44dd41b44575ce1a8";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    blink-cmp = {
      url = "github:Saghen/blink.cmp";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        fenix.follows = "fenix";
      };
    };
  };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      debug = true;

      systems = inputs.nixpkgs.lib.systems.flakeExposed;

      imports = [
        ./flake-module.nix
      ];
    };
}

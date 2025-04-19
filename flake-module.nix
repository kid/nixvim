{
  inputs,
  lib,
  self,
  ...
}:
let
  inherit (inputs) nixvim;
  nixvimConfig = import ./config self;
in
{
  flake = {
    homeModules = {
      inherit (inputs.nixvim.homeManagerModules) nixvim;
      config = _: {
        programs.nixvim = nixvimConfig;
      };
    };

    nixosModules = {
      inherit (inputs.nixvim.nixosModules) nixvim;
      config = _: {
        programs.nixvim = nixvimConfig;
      };
    };

    herculesCI.ciSystems = [ "x86_64-linux" ];
  };

  perSystem =
    { pkgs, system, ... }:
    let
      nixvimLib = nixvim.lib.${system};
      nixvim' = nixvim.legacyPackages.${system};
      nixvimModule = {
        inherit pkgs;

        module = nixvimConfig;

        extraSpecialArgs = {
          inherit inputs;
        };
      };
      nvim = nixvim'.makeNixvimWithModule nixvimModule;
    in
    {
      formatter = pkgs.nixfmt-rfc-style;

      checks = {
        # Run `nix flake check .` to verify that your config is not broken
        default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
      };

      packages = {
        # Lets you run `nix run .` to start nixvim
        default = nvim;
      };
    };
}

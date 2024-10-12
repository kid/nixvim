{ inputs, self, ... }:
let
  inherit (inputs) nixvim;
  nixvimConfig = import ./config self;
in
{
  flake = {
    homeManagerModules = {
      nixvim = inputs.nixvim.homeManagerModules.nixvim;
      config =
        { ... }:
        {
          programs.nixvim = nixvimConfig;
        };
    };
  };

  perSystem =
    { pkgs, system, ... }:
    let
      nixvimLib = nixvim.lib.${system};
      nixvim' = nixvim.legacyPackages.${system};
      nixvimModule = {
        inherit pkgs;
        # module = importApply ./config { localFlake = self; };
        # module = (importApply ./config { });
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

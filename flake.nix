{
  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.treefmt-nix.url = "github:numtide/treefmt-nix";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    treefmt-nix,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config = {};
          overlays = [];
        };
        inherit (pkgs) lib;
      in {
        packages.st = pkgs.st.overrideAttrs (prev: {
          src = lib.cleanSource ./.;
          extraLibs = [];
        });
        packages.default = self.packages.${system}.st;
        apps.st = flake-utils.lib.mkApp {
          drv = self.packages.${system}.st;
        };
        apps.default = self.apps.${system}.st;
        devShells.default = import ./shell.nix {inherit pkgs;};
        formatter = treefmt-nix.lib.mkWrapper pkgs {
          projectRootFile = "flake.nix";
          programs.alejandra.enable = true;
          #programs.clang-format.enable = true;
        };
      }
    );
}

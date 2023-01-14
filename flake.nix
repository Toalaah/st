{
  description = "Custom ST build";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        lib = pkgs.lib;
      in rec {
        formatter = pkgs.nixpkgs-fmt;
        packages.st =
          pkgs.stdenv.mkDerivation rec {
            name = "st";
            src = self;
            buildInputs = with pkgs; [
              xorg.libX11
              xorg.libXft
              pkg-config
              harfbuzz
            ];
            buildPhase = "make all";
            installPhase = ''
              mkdir -p $out/bin
              install ./${name} $out/bin/${name}
            '';
            meta = with lib; {
              homepage = "https://github.com/toalaah/st";
              description = "Custom ST build";
              license = licenses.mit;
              maintainers = with maintainers; [ toalaah ];
              platforms = platforms.unix;
            };
          };
        defaultPackage = packages.st;
        devShell = import ./shell.nix { inherit pkgs; };
      }
    );
}

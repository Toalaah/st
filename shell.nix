{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell {
  buildInputs = [
    nixpkgs-fmt
    xorg.libX11
    xorg.libXft
    pkg-config
    harfbuzz
  ];

  shellHook = ''
    # ...
  '';
}

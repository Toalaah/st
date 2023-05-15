{pkgs ? import <nixpkgs> {}}:
with pkgs;
  mkShell {
    buildInputs = [
      fontconfig
      freetype
      gnumake
      ncurses
      pkg-config
      xorg.libX11
      xorg.libXft
    ];
  }

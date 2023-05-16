{pkgs ? import <nixpkgs> {}}:
with pkgs;
  mkShell {
    nativeBuildInputs = [
      fontconfig
      freetype
      gnumake
      ncurses
      pkg-config
      xorg.libX11
      xorg.libXft
    ];
  }

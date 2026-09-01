{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = [
    pkgs.python312
    pkgs.python312Packages.virtualenv
    pkgs.poetry
    pkgs.stdenv
    pkgs.uv
  ];

  LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
    stdenv.cc.cc.lib
    zlib
    libpng
    freetype
    fontconfig
    libGL
    glib
    gdal
  ];
}

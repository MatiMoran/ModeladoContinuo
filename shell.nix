{pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
  buildInputs = [
    (pkgs.python314.withPackages (ps: [
      ps.manim
      ps.numpy
      ps.matplotlib
      ps.pandas
      ps.scipy
      ps.sympy
      ps.seaborn
      ps.ipython
      ps.ipykernel
      ps.jupyter
      ps.jupyterlab
      ps.jupyterlab-vim
      ps.jupyterlab-lsp
    ]))
    pkgs.poetry
    pkgs.uv
    pkgs.stdenv
    pkgs.ffmpeg
    (pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-medium
        standalone
        preview
        dvisvgm;
    })
  ];

  LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
    stdenv.cc.cc.lib
    cairo
    pango
    libGL
    glib
    gdal
    zlib
    libpng
    freetype
    fontconfig
  ];
}

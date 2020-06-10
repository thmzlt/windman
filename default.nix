{ pkgs ? import (fetchTarball https://github.com/nixos/nixpkgs/archive/master.tar.gz) {} }:

pkgs.stdenv.mkDerivation rec {
  version = "0.3";
  pname = "2bwm";

  src = ./.;

  #src = pkgs.fetchFromGitHub {
  #  owner = "venam";
  #  repo = "2bwm";
  #  rev = "v${version}";
  #  sha256 = "1xwib612ahv4rg9yl5injck89dlpyp5475xqgag0ydfd0r4sfld7";
  #};

  # Allow users set their own list of patches
  #inherit patches;

  buildInputs = [
    pkgs.xorg.libxcb
    pkgs.xorg.xcbutilkeysyms
    pkgs.xorg.xcbutilwm
    pkgs.xorg.libX11
    pkgs.xorg.xcbutil
    pkgs.xcbutilxrm
  ];

  installPhase = "make install DESTDIR=$out PREFIX=\"\"";
}

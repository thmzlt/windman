{ pkgs ? import (fetchTarball https://github.com/nixos/nixpkgs/archive/master.tar.gz) {} }:

let
  windman = import ./default.nix {};
in

windman.overrideAttrs (
  attrs: {
    buildInputs = attrs.buildInputs ++ [
      pkgs.clang-tools
    ];
  }
)

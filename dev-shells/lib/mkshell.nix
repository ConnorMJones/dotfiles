{ nixpkgs }:

{
  name,
  buildInputs ? [],
  nativeBuildInputs ? [],
  shellHook ? "",
  env ? {}
}:

let
  lib = nixpkgs.lib;
in
lib.genAttrs lib.systems.flakeExposed (system:
  let
    pkgs = nixpkgs.legacyPackages.${system};
  in
  pkgs.mkShell ({
    inherit buildInputs nativeBuildInputs shellHook;
  } // env)
)

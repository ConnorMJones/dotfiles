{
  description = "Lean 4 dev shell";

  inputs.nixpkgs.url = "nixpkgs";

  outputs =
    { self, nixpkgs }:
    let
      lib = nixpkgs.lib;
    in
    {
      devShells = lib.genAttrs lib.systems.flakeExposed (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              lean4
              elan # Optional: if you still want to manage versions manually
            ];
            shellHook = ''
              echo "Lean 4 environment active"
              echo "Lake version: $(lake --version)"
            '';
          };
        }
      );
    };
}

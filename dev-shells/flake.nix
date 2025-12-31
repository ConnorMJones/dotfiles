{
  description = "All dev shells";

  inputs = {
    nixpkgs.url = "nixpkgs";

    rust.url = "./rust";
    zig.url = "./zig";
    lean.url = "./lean4";
    python.url = "./python";
  };

  outputs = { self, nixpkgs, rust, zig, lean, python }:
    let
      lib = nixpkgs.lib;
    in
    {
      devShells = lib.genAttrs lib.systems.flakeExposed (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          rust = rust.devShells.${system}.default;
          zig = zig.devShells.${system}.default;
          python = python.devShells.${system}.default;
          lean = lean.devShells.${system}.default;

          full = pkgs.mkShell {
            inputsFrom = [
              rust.devShells.${system}.default
              zig.devShells.${system}.default
              lean.devShells.${system}.default
            ];
            
            shellHook = ''
              echo "--- Full Dev Shell Active ---"
            '';
          };
        }
      );
    };
}

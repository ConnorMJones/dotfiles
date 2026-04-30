{
  description = "All dev shells";

  inputs = {
    nixpkgs.url = "nixpkgs";

    tools.url = "./tools";
    zig.url = "./zig";
    lean.url = "./lean4";
    python.url = "./python";
    cuda.url = "./cuda";
  };

  outputs =
    {
      self,
      nixpkgs,
      tools,
      zig,
      lean,
      python,
      cuda,
    }:
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
          tools = tools.devShells.${system}.default;
          zig = zig.devShells.${system}.default;
          python = python.devShells.${system}.default;
          lean = lean.devShells.${system}.default;
          cuda = cuda.devShells.${system}.default;

          full = pkgs.mkShell {
            inputsFrom = [
              tools.devShells.${system}.default
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

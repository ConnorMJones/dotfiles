{
  description = "Python dev shell";

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
          myPython = pkgs.python311.withPackages (
            ps: with ps; [
              # polars this just takes too long to compile
              requests
              numpy
              black # Formatter
            ]
          );
        in
        {
          default = pkgs.mkShell {
            nativeBuildInputs = [
              myPython
              pkgs.poetry
            ];
            shellHook = ''
              echo "Python $(python --version) env active"
            '';
          };
        }
      );
    };
}

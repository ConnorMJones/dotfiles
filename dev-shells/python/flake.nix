{
  description = "Python dev shell";

  inputs.nixpkgs.url = "nixpkgs";

  outputs = { self, nixpkgs }:
    let
      lib = nixpkgs.lib;
    in
    {
      devShells = lib.genAttrs lib.systems.flakeExposed (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          # Define your python environment here
          myPython = pkgs.python311.withPackages (ps: with ps; [
            pandas
            requests
            numpy
            black # Formatter
          ]);
        in
        {
          default = pkgs.mkShell {
            nativeBuildInputs = [ myPython ];
            shellHook = ''
              echo "Python $(python --version) env active"
            '';
          };
        });
    };
}
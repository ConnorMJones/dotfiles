{
  description = "Zig dev shell";

  inputs = {
    nixpkgs.url = "nixpkgs";
  };

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
            # buildInputs: Runtime libraries
            buildInputs = with pkgs; [
              zlib
              # Add libraries for graphics or sound here if needed
            ];

            # nativeBuildInputs: Build-time tools
            nativeBuildInputs = with pkgs; [
              zig # The Zig compiler
              zls # Zig Language Server (crucial for IDE support)
              gdb # Debugger
              pkg-config # Helps Zig find C libraries
            ];

            shellHook = ''
              echo "Zig $(zig version) environment activated"
              echo "ZLS (Language Server) is available"
            '';
          };
        }
      );
    };
}

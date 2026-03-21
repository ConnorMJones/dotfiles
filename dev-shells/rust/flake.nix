{
  description = "Rust dev shell";

  inputs = {
    nixpkgs.url = "nixpkgs";
  };

  outputs = { self, nixpkgs }:
    let
      lib = nixpkgs.lib;
    in
    {
      devShells = lib.genAttrs lib.systems.flakeExposed (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              glib
              openssl
              protobuf_29
              kubectl
              awscli
              jq
              docker-compose
              postgresql_18
            ];

            nativeBuildInputs = with pkgs; [
              pkg-config
              python311
              lsof
            ];

            shellHook = ''
              echo "rust environment activated"
            '';
          };
        });
    };
}

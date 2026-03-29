{
  description = "CUDA dev shell";

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
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          cudaPackages = pkgs.cudaPackages;
        in
        {
          default = pkgs.mkShell {
            buildInputs = with cudaPackages; [
              cudatoolkit
              cudnn
            ];

            nativeBuildInputs = with pkgs; [
              cmake
              pkg-config
            ];

            env = {
              CUDA_PATH = "${cudaPackages.cudatoolkit}";
            };

            shellHook = ''
              echo "Cuda environment activated"
            '';
          };
        });
    };
}

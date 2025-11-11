{
  description = "Zig Environment Construction";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... } @ var:
  let
    pkgs =  nixpkgs.legacyPackages."x86_64-linux";
  in
  {
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = [];
      nativeBuildInputs = [];
    };
  };
}

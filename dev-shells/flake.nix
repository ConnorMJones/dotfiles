{
  description = "All dev shells";

  inputs = {
    nixpkgs.url = "nixpkgs";

    rust.url = "./rust";
  };

  outputs = { self, nixpkgs, rust }:
    let
      lib = nixpkgs.lib;
    in
    {
      devShells = lib.genAttrs lib.systems.flakeExposed (system: {
        rust   = rust.devShells.${system}.default;
      });
    };
}

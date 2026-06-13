{
  description = "Local aggregate flake modules";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs = {
      url = "path:./emacs";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    { emacs, ... }:
    let
      shared = import ./shared;
      base16Scheme = shared.base16_scheme;
    in
    {
      lib = {
        inherit base16Scheme shared;
      };

      homeManagerModules = {
        emacs = emacs.lib.mkHomeManagerModule { base16 = base16Scheme; };
        default = emacs.lib.mkHomeManagerModule { base16 = base16Scheme; };
      };
    };
}

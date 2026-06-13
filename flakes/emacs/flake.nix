{
  description = "Emacs Home Manager module with Org and Hel keybindings";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hel = {
      url = "github:anuvyklack/hel";
      flake = false;
    };
    helheim-emacs = {
      url = "github:anuvyklack/helheim-emacs";
      flake = false;
    };
  };

  outputs =
    { hel, helheim-emacs, ... }:
    let
      mkHomeManagerModule =
        {
          base16 ? import ./base16.nix,
        }:
        import ./home-manager.nix {
          inherit hel helheim-emacs base16;
        };
    in
    {
      lib = {
        inherit mkHomeManagerModule;
      };

      homeManagerModules.default = mkHomeManagerModule { };
    };
}

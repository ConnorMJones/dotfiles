{
  description = "flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      stylix,
      home-manager,
      ...
    }@glb:
    let
      common = [
        ./modules/browsers/firefox.nix
        ./modules/apps.nix
        ./modules/audio.nix
        ./modules/bootloader.nix
        ./modules/dev.nix
        ./modules/locale.nix
        ./modules/niri.nix
        ./modules/shell.nix
        ./modules/users.nix
      ];
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in
    {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          # access anything else in ... from glb build wide
          specialArgs = glb;
          modules = common ++ [
            ./modules/browsers/chrome.nix
            ./hosts/laptop/configuration.nix
            ./hosts/laptop/hardware-configuration.nix
            ./modules/decor/stylix.nix
            ./modules/nvidia.nix
            ./modules/typst.nix
            ./modules/gnome.nix
            ./modules/xserver.nix
            ./modules/keyboard.nix
            stylix.nixosModules.stylix
          ];
        };
      };
      homeConfigurations = {
        connor = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./users/connor/home.nix ];
        };
      };
    };
}

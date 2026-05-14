{
  description = "flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dev-shells = {
      url = "path:./dev-shells";
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
        ./modules/apps.nix
        ./modules/audio.nix
        ./modules/bootloader.nix
        ./modules/locale.nix
        ./modules/shell.nix
        ./modules/users.nix
        ./modules/xdg.nix
      ];
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in
    {
      nixpkgs.config.allowUnfree = true;
      nix.registry.nixpkgs.flake = nixpkgs;
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          # access anything else in ... from glb build wide
          specialArgs = glb;
          modules = common ++ [
            ./hosts/laptop/configuration.nix
            ./hosts/laptop/hardware-configuration.nix
            ./modules/decor/stylix.nix
            ./modules/decor/fonts-cjk.nix
            ./modules/input-methods.nix
            ./modules/nvidia.nix
            ./modules/gnome.nix
            ./modules/xserver.nix
            ./modules/keyboard.nix
            ./modules/dev.nix
            ./modules/services.nix
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

      formatter.x86_64-linux = pkgs.nixfmt-tree;
    };
}

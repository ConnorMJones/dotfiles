{
  description = "flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  };

  outputs = { self, nixpkgs }:
  let 
    shared = [
      ./modules/browsers/firefox.nix
      ./modules/apps.nix
      ./modules/audio.nix
      ./modules/bootloader.nix
      #./modules/cli.nix
      ./modules/dev.nix
      ./modules/locale.nix
      ./modules/niri.nix
      ./modules/shell.nix
      ./modules/users.nix
    ];
  in
  {

    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
  
    nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = shared ++ [
            ./hosts/laptop/configuration.nix
            ./hosts/laptop/hardware-configuration.nix
            ./modules/nvidia.nix
            ./modules/typst.nix
            ./modules/xserver.nix
          ];
        };
      };
    };
}

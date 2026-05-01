{
  description = "Tools";

  inputs = {
    nixpkgs.url = "nixpkgs";
    kubefwd-src = {
      url = "github:txn2/kubefwd";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      kubefwd-src,
    }:
    let
      lib = nixpkgs.lib;
    in
    {
      devShells = lib.genAttrs lib.systems.flakeExposed (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          kubefwd = pkgs.buildGoModule {
            pname = "kubefwd";
            version = "master";
            src = kubefwd-src;
            vendorHash = "sha256-0Tcov+4a6bPVfT9QKaHfHQAHJnP9QvDdMpCk/xSzTFU=";
            excludedPackages = [ "test/integration" ];
            ldflags = [
              "-s"
              "-w"
            ];
            meta.mainProgram = "kubefwd";
          };
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
              kubefwd
            ];

            nativeBuildInputs = with pkgs; [
              pkg-config
              alsa-lib
              python311
              lsof
            ];

            shellHook = ''
              echo "Tools added to shell"
            '';
          };
        }
      );
    };
}

{ pkgs, ... }:
{
  # https://wiki.nixos.org/wiki/Docker
  # https://nix.dev/tutorials/nixos/building-and-running-docker-images.html

  virtualisation.docker = {
    enable = true;
    package = pkgs.docker_29;
    autoPrune.enable = true;
    # Set up resource limits
    daemon.settings = {
      experimental = true;
      default-address-pools = [
        {
          base = "172.30.0.0/16";
          size = 24;
        }
      ];
    };
  };

  # services.postgresql.enable = true;
  services.postgresql.package = pkgs.postgresql_18;

  # Add your user to the "docker" group to run docker without sudo
  users.users.connor.extraGroups = [ "docker" ];

}

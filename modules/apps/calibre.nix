{ pkgs, ... }:
{
  # services.udisks2 = {
  # enable = true;
  # mountOnMedia = true;
  # };
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    calibre
    unrar
    p7zip
    djvulibre
  ];
  # services.calibre-web = {
  #   enable = true;
  #   options = {
  #     calibreLibrary = "/srv/calibre-library";
  #     port = 8083;
  #   };
  # };

  # optional: firewall
  # networking.firewall.allowedTCPPorts = [ 8083 ];
}

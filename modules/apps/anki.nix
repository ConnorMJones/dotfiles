{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.anki ];
  #services.anki-sync-server = {
  #    enable = true;
  #};
}

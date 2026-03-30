{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.anki.withAddons (
      with pkgs.ankiAddons;
      [
        anki-connect
      ]
    ))
  ];
  #services.anki-sync-server = {
  #    enable = true;
  #};
}

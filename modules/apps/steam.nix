{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    heroic
  ];
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
}

{ config, pkgs, ... }:
{
  imports = [
    ./apps/anki.nix
    ./apps/steam.nix
    ./browsers/firefox.nix
    ./browsers/chrome.nix
  ];
  environment.systemPackages = with pkgs; [
    neofetch
    discord
    obsidian
    slack
    flameshot
    brave
  ];
}

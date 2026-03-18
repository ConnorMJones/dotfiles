{ config, pkgs, ... }:
{
  imports = [
    ./apps/anki.nix
    ./apps/steam.nix
    ./apps/zotero.nix
    ./apps/1password.nix
    ./browsers/firefox.nix
    ./browsers/chrome.nix
  ];
  environment.systemPackages = with pkgs; [
    fastfetch
    discord
    element-desktop
    obsidian
    slack
    flameshot
    brave
    libreoffice-qt
    hunspell
    #wineWowPackages.stable
    #wineWowPackages.staging
    #wineWowPackages.waylandFull
    #winetricks
  ];
}

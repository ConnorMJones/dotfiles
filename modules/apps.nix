{ pkgs, ... }:
{
  imports = [
    ./apps/anki.nix
    ./apps/steam.nix
    ./apps/zotero.nix
    ./apps/calibre.nix
    ./apps/foliate.nix
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
    sticky
  ];
}

{ pkgs, upkgs, ... }:
{
  imports = [
    ./apps/anki.nix
    ./apps/steam.nix
    ./apps/zotero.nix
    ./apps/calibre.nix
    ./apps/1password.nix
    ./apps/video-editing.nix
    ./apps/todoist.nix
    ./browsers/firefox.nix
    ./browsers/chrome.nix
  ];
  environment.systemPackages = [
    pkgs.fastfetch
    upkgs.discord
    pkgs.element-desktop
    pkgs.signal-desktop
    upkgs.obsidian
    upkgs.slack
    pkgs.flameshot
    pkgs.brave
    pkgs.librepods
    pkgs.libreoffice-qt
    pkgs.hunspell
    pkgs.sticky
  ];
}

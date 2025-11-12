{ config, pkgs, ... }:
{
  imports = [
    ./anki.nix
    ./steam.nix
  ];
  environment.systemPackages = with pkgs; [
    neofetch
    discord
    obsidian
    slack
    flameshot
  ];
}

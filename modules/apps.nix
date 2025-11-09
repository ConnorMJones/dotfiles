{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        neofetch
        firefox
        steam
        discord
        obsidian
        slack
        flameshot
    ];
}
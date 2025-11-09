{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        neofetch
        discord
        obsidian
        slack
        flameshot
    ];
}
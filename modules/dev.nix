{ config, pkgs, ... }:
{
    programs = {
        git.enable = true;
        tmux.enable = true;
        neovim = {
            enable = true;
            defaultEditor = true;
        };
    };
    environment.systemPackages = with pkgs; [ vscode ];
}
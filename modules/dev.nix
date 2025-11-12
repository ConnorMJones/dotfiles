{ config, pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
    };
    tmux.enable = true;
    # https://wiki.nixos.org/wiki/Neovim/en
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        # vscodevim.vim
        yzhang.markdown-all-in-one
      ];
    };
  };
  environment.systemPackages = with pkgs; [
    curl
    btop
    clang
    gcc
    bash
    nixfmt-tree
    sqlite
    rustup
    gnumake
    tracy
    yt-dlp
    ffmpeg-full
    nixfmt
    nixd
  ];
}

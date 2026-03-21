{ pkgs, ... }:
{
  imports = [
    ./dev/typst.nix
    ./dev/docker.nix
    ./dev/claude.nix
  ];
  programs = {
    git = {
      enable = true;
    };
    tmux = { 
      enable = true;
      terminal = "screen-256color";
    };
    # https://wiki.nixos.org/wiki/Neovim/en
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        yzhang.markdown-all-in-one
        jnoortheen.nix-ide
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
    p7zip
    helix
    gitui
    nvtopPackages.full
  ];
}

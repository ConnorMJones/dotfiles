{ pkgs, ... }:
{
  imports = [
    ./dev/tmux.nix
    ./dev/typst.nix
    ./dev/docker.nix
    ./dev/claude.nix
  ];
  environment.variables.EDITOR = "hx";

  programs = {
    git = {
      enable = true;
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
    ripgrep
    ripgrep-all
    poppler
  ];
}

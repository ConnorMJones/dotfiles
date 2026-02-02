{ config, pkgs, ... }:
{
  imports = [
    ./dev/typst.nix
    ./dev/docker.nix
    ./dev/nixld.nix
    ./dev/claude.nix
  ];
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
        jnoortheen.nix-ide
      ];
    };
    #nix-ld = {
    #  enable = true;
    #  libraries = with pkgs; [
    #    glib
    #    gobject-introspection
    #    gtk3
    #    gdk-pixbuf
    #    pango
    #    cairo
    #    xorg.libX11
    #    xorg.libXcomposite
    #    xorg.libXdamage
    #    xorg.libXext
    #    xorg.libXfixes
    #    xorg.libXrandr
    #    xorg.xcbutil
    #    xorg.xcbutilimage
    #    xorg.xcbutilkeysyms
    #    xorg.xcbutilrenderutil
    #    xorg.xcbutilwm
    #    xorg.libxshmfence
    #    libxkbcommon
    #    mesa
    #    libdrm
    #    xgboost
    #    alsa-lib
    #    pulseaudio
    #    nss
    #    nspr
    #    atk
    #    at-spi2-core
    #    at-spi2-atk
    #    cups
    #    dbus
    #    expat
    #    fontconfig
    #  ];
    #};
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
    nvtopPackages.full
  ];
}

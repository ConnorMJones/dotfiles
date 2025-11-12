{ config, pkgs, ... }:
{
  stylix = {
    enable = true;
    image = ./wallpaper.jpg;
    polarity = "dark";

    opacity = {
      applications = 1.0;
      terminal = 1.0;
      desktop = 1.0;
      popups = 1.0;
    };
    # https://nixos.wiki/wiki/Fonts
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Iosevka";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 10;
        popups = 10;
      };

    };
  };

  # https://tinted-theming.github.io/tinted-gallery/
  stylix.base16Scheme = {
    base00 = "#061229";
    base01 = "#2a3448";
    base02 = "#4d5666";
    base03 = "#717885";
    base04 = "#9a99a3";
    base05 = "#b8bbc2";
    base06 = "#dbdde0";
    base07 = "#ffffff";
    base08 = "#d07346";
    base09 = "#f0a000";
    base0A = "#fbd461";
    base0B = "#99bf52";
    base0C = "#72b9bf";
    base0D = "#5299bf";
    base0E = "#9989cc";
    base0F = "#b08060";
  };
}

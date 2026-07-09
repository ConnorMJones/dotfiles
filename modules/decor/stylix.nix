{ pkgs, ... }:
let
  shared = import ../../flakes/shared;
  base16Scheme = shared.base16_scheme;
in
{
  stylix = {
    enable = true;
    image = ./wallpaper.jpg;
    polarity = "dark";
    autoEnable = true;

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
  stylix.base16Scheme = base16Scheme;
}

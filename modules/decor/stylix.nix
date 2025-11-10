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
    sizes = {
        applications = 12;
        terminal = 15;
        desktop = 10;
        popups = 10;
    };
    # https://nixos.wiki/wiki/Fonts
    fonts = {
        monospace = {
            package = pkgs.nerdfonts.override {fonts = ["Iosevka"];};
            name = "Iosevka";
        };
        sansSerif = {
            package = pkgs.nerdfonts.override {fonts = ["DejaVu Sans"];};
            # package = pkgs.dejavu_fonts;
            name = "DejaVu Sans";
        };
        serif = {
            package = pkgs.nerdfonts.override {fonts = ["DejaVu Serif"];};
            # package = pkgs.dejavu_fonts;
            name = "DejaVu Serif";
        };
    };
  };

  # SAGA
  # https://tinted-theming.github.io/tinted-gallery/
  stylix.base16Scheme = {
    base00 = "05080a"; # Obsidian
    base01 = "0a1014"; # Liquorice
    base02 = "0f181e"; # Charcoal
    base03 = "141f27"; # Asphalt
    base04 = "192630"; # Gunmetal
    base05 = "dce2f7"; # Marshmallow
    base06 = "f8eae7"; # Linen
    base07 = "ccd3fe"; # Lavender
    base08 = "ffd4e9"; # Azalea
    base09 = "fbcbae"; # Apricot
    base0A = "fbebc8"; # Blond
    base0B = "f7ddff"; # Lace
    base0C = "c5edc1"; # Tea
    base0D = "c9fff7"; # Celeste
    base0E = "dcc3f9"; # Anemone
    base0F = "f6dddd"; # Lycoris
  };
}
{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    wqy_zenhei
  ];

  # Ensure fontconfig picks up CJK fonts as fallback
  fonts.fontconfig = {
    defaultFonts = {
      sansSerif = [ "DejaVu Sans" "Noto Sans CJK SC" ];
      serif = [ "DejaVu Serif" "Noto Serif CJK SC" ];
      monospace = [ "Iosevka" "Noto Sans Mono CJK SC" ];
    };
  };
}

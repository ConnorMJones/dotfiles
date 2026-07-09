let
  styles = import ./styles.nix;
  base16_keys = {
    base00 = null;
    base01 = null;
    base02 = null;
    base03 = null;
    base04 = null;
    base05 = null;
    base06 = null;
    base07 = null;
    base08 = null;
    base09 = null;
    base0A = null;
    base0B = null;
    base0C = null;
    base0D = null;
    base0E = null;
    base0F = null;
  };
  style_to_base16 = style: builtins.intersectAttrs base16_keys style.palette;
in
styles
// {
  inherit style_to_base16;

  base16_scheme = style_to_base16 styles.current_style;
  base16Scheme = style_to_base16 styles.current_style;
}

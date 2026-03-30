{ ... }:
{
  # Fix F13-F24 keys to output correct keysyms
  home.file.".config/xkb/symbols/highfnkeys".text = ''
    default partial function_keys
    xkb_symbols "highfnkeys" {
      key <FK13> { [ F13 ] };
      key <FK14> { [ F14 ] };
      key <FK15> { [ F15 ] };
      key <FK16> { [ F16 ] };
      key <FK17> { [ F17 ] };
      key <FK18> { [ F18 ] };
      key <FK19> { [ F19 ] };
      key <FK20> { [ F20 ] };
      key <FK21> { [ F21 ] };
      key <FK22> { [ F22 ] };
      key <FK23> { [ F23 ] };
      key <FK24> { [ F24 ] };
      key <I202> { [ F24 ] };
    };
  '';

  home.file.".config/xkb/rules/evdev".text = ''
    ! include %S/evdev
    ! model = symbols
      * = +highfnkeys(highfnkeys)
  '';
}

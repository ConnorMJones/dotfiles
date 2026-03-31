{ pkgs, ... }:
{
  hardware.keyboard.zsa.enable = true;
  environment.systemPackages = with pkgs; [ wally-cli ];

  # Map ZSA's F24 (keycode 202/prog3) to actual F24 at evdev level
  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings.main = {
        prog3 = "f24";
      };
    };
  };
}

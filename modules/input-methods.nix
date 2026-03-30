{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        qt6Packages.fcitx5-chinese-addons  # Pinyin and other Chinese input methods
        fcitx5-gtk                          # GTK integration
      ];
      waylandFrontend = true;
      settings = {
        globalOptions = {
          "Hotkey" = {
            "TriggerKeys" = "F24";
          };
          "Hotkey/PrevPage" = {
            "0" = "minus";
          };
          "Hotkey/NextPage" = {
            "0" = "plus";
          };
          "Behavior" = {
            "ShowInputMethodInformation" = "True";
          };
        };
        inputMethod = {
          "Groups/0" = {
            "Name" = "Default";
            "Default Layout" = "us";
            "DefaultIM" = "keyboard-us";
          };
          "Groups/0/Items/0" = {
            "Name" = "keyboard-us";
            "Layout" = "";
          };
          "Groups/0/Items/1" = {
            "Name" = "pinyin";
            "Layout" = "";
          };
          "GroupOrder" = {
            "0" = "Default";
          };
        };
      };
    };
  };
}

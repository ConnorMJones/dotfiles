{ ... }:
{
  # User settings for fcitx5 (system setup is in modules/input-methods.nix)
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
  };
  i18n.inputMethod.fcitx5.settings = {
    globalOptions = {
      "Hotkey" = {
        "TriggerKeys" = "Control+space";
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
}

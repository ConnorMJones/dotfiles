{ config, pkgs, lib, ... }:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "connor";
  home.homeDirectory = "/home/connor";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  imports = [ ./wacom.nix ];
  #services.displayManager.gdm = {
  #  enable = true;
  #  autoSuspend = false;
  #  # wayland = true;
  #};
  #services.desktopManager.gnome.enable = true;
  #services.gnome.gnome-settings-daemon.enable = true;

  # Use `dconf watch /` to track stateful changes you are doing and store them here.
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = lib.gvariant.mkBoolean false;
      idle-brightness = lib.gvariant.mkUint32 100;
      ambient-enabled = lib.gvariant.mkBoolean false;
      sleep-inactive-battery-type = "nothing";
      sleep-inactive-battery-timeout = lib.gvariant.mkUint32 0;
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-ac-timeout = lib.gvariant.mkUint32 0;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
  };
  programs.home-manager.enable = true;
}

{ config, pkgs, ... }:
{
    # Enable the X11 windowing system.
    # Enable the GNOME Desktop Environment.
    services.displayManager.gdm = {
        enable = true;
        autoSuspend = false;
        # wayland = true;
    };
    services.desktopManager.gnome.enable = true;
    services.gnome.gnome-settings-daemon.enable = true;
    services.desktopManager.gnome.extraGSettingsOverrides = ''
        [org/gnome/settings-daemon/plugins/power]
        idle-dim=false
        idle-brightness=100
    '';

    # To disable installing GNOME's suite of applications
    # and only be left with GNOME shell.
    # services.gnome.core-apps.enable = false;
    # services.gnome.core-developer-tools.enable = false;
    # services.gnome.games.enable = false;
    # environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];
}

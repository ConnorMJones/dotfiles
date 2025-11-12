{
  config,
  pkgs,
  lib,
  ...
}:
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

  # These might only be default settings getting overriden by dconf or others.
  # https://nixos.org/manual/nixos/stable/#sec-gnome-gsettings-overrides
  services.desktopManager.gnome.extraGSettingsOverrides = ''
        [org/gnome/settings-daemon/plugins/power]
        idle-dim=false
        idle-brightness=100
        ambient-enabled=false
        sleep-inactive-ac-type='nothing'
        sleep-inactive-ac-timeout=0
        sleep-inactive-battery-type='nothing'
        sleep-inactive-battery-timeout=0

    [org/gnome/desktop/session]
        idle-delay=uint32 0

  '';

  # per suggestion by gemini
  # also see: https://nixos.wiki/wiki/GNOME
  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        lockAll = true; # optional
        settings = {
          "org.gnome.settings-daemon.plugins.power" = {
            idle-dim = lib.gvariant.mkBoolean false;
            idle-brightness = lib.gvariant.mkUint32 100;
            ambient-enabled = lib.gvariant.mkBoolean false;
            sleep-inactive-ac-timeout = lib.gvariant.mkUint32 0;
            sleep-inactive-ac-type = "nothing";
            sleep-inactive-battery-timeout = lib.gvariant.mkUint32 0;
            sleep-inactive-battery-type = "nothing";
          };
        };
      }
    ];
  };

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  # services.gnome.core-apps.enable = false;
  # services.gnome.core-developer-tools.enable = false;
  # services.gnome.games.enable = false;
  # environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];
  environment.gnome.excludePackages = (
    with pkgs;
    [
      atomix # puzzle game
      #cheese # webcam tool
      epiphany # web browser
      evince # document viewer
      #geary # email reader
      gedit # text editor
      #gnome-characters
      #gnome-music
      #gnome-photos
      #gnome-terminal
      gnome-tour
      hitori # sudoku game
      iagno # go game
      tali # poker game
      #totem # video player
    ]
  );
}

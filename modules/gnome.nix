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
  programs.dconf.enable = true;

  # To disable installing GNOME's suite of applications
  environment.gnome.excludePackages = (
    with pkgs;
    [
      atomix # puzzle game
      epiphany # web browser
      evince # document viewer
      gedit # text editor
      gnome-tour
      hitori # sudoku game
      iagno # go game
      tali # poker game
    ]
  );
}

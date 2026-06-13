{ pkgs, ... }:
{
  # Try this for now for calendar/ planning
  # other options:
  # (Morgen, thunderbird, Emacs org mode, GNOME Calendar + Planify, Obsidian)
  # korganizer still missing stuff
  environment.systemPackages = with pkgs; [
    kdePackages.korganizer
    rnote
    xournalpp
  ];
}

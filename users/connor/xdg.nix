{ ... }:
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    desktop = "$HOME/desktop";
    download = "$HOME/downloads";
    templates = "$HOME/templates";
    publicShare = "$HOME/public";
    documents = "$HOME/documents";
    music = "$HOME/music";
    pictures = "$HOME/pictures";
    videos = "$HOME/videos";

    extraConfig = {
      PROJECTS = "$HOME/projects";
      READING = "$HOME/reading";
    };
  };
}

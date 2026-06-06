{ ... }:
{
  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = false;

    desktop = "$HOME/desktop";
    download = "$HOME/downloads";
    publicShare = "$HOME/public";
    documents = "$HOME/documents";
    music = "$HOME/music";
    pictures = "$HOME/pictures";
    videos = "$HOME/videos";
    templates = "$HOME";

    extraConfig = {
      XDG_PROJECTS_DIR = "$HOME/projects";
      XDG_READING_DIR = "$HOME/reading";
    };
  };

  home.file.".local/state/bash/.keep".text = "";
  home.file.".local/state/less/.keep".text = "";
  home.file.".config/aws/.keep".text = "";
  home.file.".config/kube/.keep".text = "";
  home.file.".local/share/aws/.keep".text = "";
}

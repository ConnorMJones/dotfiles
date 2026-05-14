{ pkgs, ... }:
{
  xdg.enable = true;
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
      XDG_PROJECTS_DIR = "$HOME/projects";
      XDG_READING_DIR = "$HOME/reading";
    };
  };

  home.sessionVariables = {
    CARGO_HOME = "$HOME/.local/share/cargo";
    RUSTUP_HOME = "$HOME/.local/share/rustup";
    DOTNET_CLI_HOME = "$HOME/.local/share/dotnet";

    AWS_CONFIG_FILE = "$HOME/.config/aws/config";
    AWS_SHARED_CREDENTIALS_FILE = "$HOME/.local/share/aws/credentials";
    KUBECONFIG = "$HOME/.config/kube/config";
    KUBECACHEDIR = "$HOME/.cache/kube";

    HISTFILE = "$HOME/.local/state/bash/history";
    GNUPGHOME = "$HOME/.local/share/gnupg";
    LESSHISTFILE = "$HOME/.local/state/less/history";
    CUDA_CACHE_PATH = "$HOME/.cache/nv";
  };

  home.file.".local/state/bash/.keep".text = "";
  home.file.".local/state/less/.keep".text = "";
  home.file.".config/aws/.keep".text = "";
  home.file.".config/kube/.keep".text = "";
  home.file.".local/share/aws/.keep".text = "";

  home.packages = with pkgs; [
    xdg-ninja
  ];
}

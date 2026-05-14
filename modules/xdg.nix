{ pkgs, ... }:
{
  environment.sessionVariables = {
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

  environment.systemPackages = with pkgs; [
    xdg-ninja
  ];
}

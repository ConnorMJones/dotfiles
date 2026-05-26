{ ... }:
{
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    escapeTime = 0;
    historyLimit = 10000;
    extraConfig = ''
      set -ag terminal-overrides ",xterm-256color:Tc"
    '';
  };
}

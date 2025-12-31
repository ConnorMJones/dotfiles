{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      v = "nvim";
      ll = "ls -la";
    };

    shellInit = ''
      function sh
          if test (count $argv) -eq 0
              echo "Usage: sh <shell>"
              echo "Available shells:"
              echo "  rust zig python lean full"
              return 1
          end

          set shell $argv[1]
          nix develop ~/.dotfiles/dev-shells#$shell -c fish
      end
    '';
  };
}

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

      # Open a folder in Obsidian (assumes it's already a vault, or doesn't care)
      # Usage: o [path]  (defaults to current directory)
      function o
          set -l target_path (realpath (test (count $argv) -gt 0; and echo $argv[1]; or echo .))

          if not test -d "$target_path"
              echo "Error: '$target_path' is not a directory"
              return 1
          end

          set -l encoded_path (string escape --style=url "$target_path")
          xdg-open "obsidian://open?path=$encoded_path"
      end

      # Create a new Obsidian vault and open it
      # Usage: oinit <vault-name>
      function oinit
          if test (count $argv) -eq 0
              echo "Usage: oinit <vault-name>"
              return 1
          end

          set -l vault_name $argv[1]

          if not test -d "$vault_name"
              mkdir -p "$vault_name"
          end

          set -l target_path (realpath "$vault_name")
          mkdir -p "$target_path/.obsidian"
          echo "Initialized Obsidian vault at $target_path"

          set -l encoded_path (string escape --style=url "$target_path")
          xdg-open "obsidian://open?path=$encoded_path"
      end
    '';
  };
}
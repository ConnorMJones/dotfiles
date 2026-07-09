{ ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      vim = "hx";
      ll = "ls -la";
    };

    shellInit = ''
      fish_add_path ~/.local/bin

      function sh
          if test (count $argv) -eq 0
              echo "Usage: sh <shell> [shell2...]"
              echo "Available shells:"
              echo "  rust zig python lean cuda full"
              return 1
          end

          if test (count $argv) -eq 1
              nix develop ~/.dotfiles/dev-shells#$argv[1] -c fish
          else
              set shell_list ""
              for shell in $argv
                  set shell_list "$shell_list ds.devShells.x86_64-linux.$shell"
              end

              nix develop --impure --expr "
                let
                  ds = builtins.getFlake \"path:$HOME/.dotfiles/dev-shells\";
                  pkgs = ds.inputs.nixpkgs.legacyPackages.x86_64-linux;
                in pkgs.mkShell { inputsFrom = [$shell_list ]; }
              " -c fish
          end
      end

      function claude-personal
        CLAUDE_CONFIG_DIR=~/.claude-personal claude $argv
      end

      function claude-work
        CLAUDE_CONFIG_DIR=~/.claude-work claude $argv
      end
    '';
  };
}

{ ... }:
let
  nvf = import (
    builtins.fetchTarball {
      url = "https://github.com/notashelf/nvf/archive/09470524a214ed26633ddc2b6ec0c9bf31a8b909.tar.gz";
      # Optionally, you can add 'sha256' for verification and caching
      # sha256 = "<sha256>";
    }
  );
in
{
  imports = [
    # Import the NixOS module from your fetched input
    nvf.nixosModules.nvf
  ];

  # https://notashelf.github.io/nvf/index.xhtml#sec-nixos-flakeless
  programs.nvf = {
    enable = true;

    settings.vim = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
      };
    };
  };
}

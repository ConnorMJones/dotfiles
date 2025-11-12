{ config, pkgs, ... }:
let
  myAlias = {
    vim = "nvim";
    v = "nvim";
    ll = "ls -la";
    rsh = "nix-shell /.dotfiles/dev-shells/rust.nix --command fish";
  };
in
{
  programs = {
    fish = {
      enable = true;
      shellAliases = myAlias;
    };
  };
}

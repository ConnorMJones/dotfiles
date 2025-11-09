{ config, pkgs, ... }:
let myAlias = {
    vim = "nvim";
    v = "nvim";
    ll = "ls -la";
}; in
{
    programs = {
        fish = {
            enable = true;
            shellAliases = myAlias;
        };
    };
}

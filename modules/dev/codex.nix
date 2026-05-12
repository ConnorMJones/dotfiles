{ pkgs, ... }:
{
  networking.firewall.allowedTCPPorts = [ 8390 ];
  environment.systemPackages = [
    pkgs.codex
  ];
}

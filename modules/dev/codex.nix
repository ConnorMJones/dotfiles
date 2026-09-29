{ upkgs, ... }:
{
  networking.firewall.allowedTCPPorts = [ 8390 ];
  environment.systemPackages = [ upkgs.codex ];
}

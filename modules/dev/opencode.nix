{ upkgs, ... }:
{
  environment.systemPackages = [
    upkgs.opencode
    upkgs.opencode-claude-auth
  ];
}
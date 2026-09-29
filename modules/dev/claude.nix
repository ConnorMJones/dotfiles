{ upkgs, ... }:
{
  environment.systemPackages = [
    upkgs.claude-code
  ];
}

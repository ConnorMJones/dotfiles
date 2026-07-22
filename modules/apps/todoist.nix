{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    todoist-electron # desktop app
    todoist # CLI client
  ];
}

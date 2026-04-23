{ pkgs, ... }:
{
  # For kubefwd
  environment.etc.hosts.mode = "0644";
  systemd.user.services.obsidian = {
    description = "Obsidian Boot on Start Up";
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.obsidian}/bin/obsidian";
    # restart = "always";  # Optional: if you want Obsidian to restart if it crashes
  };
}

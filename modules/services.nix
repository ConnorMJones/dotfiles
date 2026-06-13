{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.tailscale
  ];
  services.tailscale = {
    enable = true;
    package = pkgs.tailscale;
    extraSetFlags = ["--netfilter-mode=nodivert"];
    useRoutingFeatures = "client";
  };

  services.resolved.enable = true;
  systemd.network.enable = true;
  networking.firewall.allowedTCPPorts = [ 8888 ];
  networking.firewall.checkReversePath = "loose";
  networking.nftables.enable = true;
  # systemd.services.tailscaled = {
  #   # reloadIfChanged = true;
  #   restartIfChanged = false;
  # };
  # systemd.services.tailscaled.serviceConfig .Environment = [
  #   "HTTP_PROXY=http://cxrs-proxy:8888"
  #   "HTTPS_PROXY=http://cxrs-proxy:8888"
  #   "http_proxy=http://cxrs-proxy:8888"
  #   "https_proxy=http://cxrs-proxy:8888"
  # ];

  # For kubefwd
  environment.etc.hosts.mode = "0644";
  systemd.user.services.obsidian = {
    description = "Obsidian Boot on Start Up";
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.obsidian}/bin/obsidian";
    # restart = "always";  # Optional: if you want Obsidian to restart if it crashes
  };
}

{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.linuxKernel.packages.linux_5_15.rtw89
  ];
  hardware.usb-modeswitch.enable = true;

  networking.hostName = "laptop";
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
  hardware.bluetooth.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.shells = with pkgs; [ fish ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # --- networking
  networking.networkmanager = {
    enable = true;
    wifi.powersave = false;
  };
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Configure network proxy if necessary
  # networking.proxy.default = "socks5://127.0.0.1:1080";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 1080 2222 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services._3proxy = {
    enable = true;
    services = [
      {
        type = "socks";
          auth = [ "strong" ];
          acl = [ {
            rule = "allow";
            users = [ "test1" ];
          }
        ];
      }
    ];
    usersFile = "/etc/3proxy.passwd";
  };

  environment.etc = {
    "3proxy.passwd".text = ''
      test1:CL:password1
    '';
  };

}

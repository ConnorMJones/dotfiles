{ ... }:
{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.extraConfig."10-bluez-a2dp-only" = {
      "monitor.bluez.properties" = {
        # Keep Bluetooth audio devices on the stable high-quality audio path.
        # The headset/HFP roles are what AirPods were using when the recent
        # disconnect hit an A2DP suspend timeout and a stale BlueZ transport.
        "bluez5.roles" = [
          "a2dp_sink"
          "a2dp_source"
        ];
      };
    };
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

}

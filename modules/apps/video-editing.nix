{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    davinci-resolve
    kdePackages.kdenlive

    ffmpeg-full
    clinfo
    frei0r
    libva-utils
    mediainfo
    mlt
    vulkan-tools
  ];

  # Desktop settings/file dialogs used by the video editors expect dconf to be
  # available under GNOME.
  programs.dconf.enable = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      ocl-icd
      vulkan-loader
    ];
  };
}

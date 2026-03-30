{ ... }:
{
  programs.chromium = {
    enable = true;

    #extraOpts = {};
    extensions = [
      "gcbommkclmclpchllfjekcdonpmejbdp" # https everywhere
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    ];
  };
}

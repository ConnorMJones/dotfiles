{ ... }:
# RTL8852CE PCIe ASPM workaround: buggy L1 power states cause RXDCK/flush-queue
# timeouts (Wi-Fi flapping + BT audio stutter). Remove once fixed upstream.
{
  boot.extraModprobeConfig = ''
    options rtw89_pci disable_aspm_l1=Y disable_aspm_l1ss=Y disable_clkreq=Y
    options btusb reset=0
  '';
}

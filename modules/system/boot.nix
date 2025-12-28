{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelParams = [
    "usbcore.autosuspend=-1"
    "amdgpu.runpm=0"
    "reboot=pci"
    "pcie_aspm=off"
  ];
}

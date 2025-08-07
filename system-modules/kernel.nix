{ pkgs, lib, config, ... }: {
  config = {
    boot = {
      kernelPackages = pkgs.linuxPackages_zen;
      kernelParams = [ "acpi=force" "reboot=efi" ];
    };
  };
}


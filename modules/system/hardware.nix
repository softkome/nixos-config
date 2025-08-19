{ pkgs, ... }: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;  };

  services.xserver.videoDrivers = [ "amdgpu" ];

  # Audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Printing
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplip pkgs.gutenprint ];
}


{ pkgs, ... }: {

  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "/etc/nixos";
    useSudo = true;
    nixosProfile = "nixos-desktop";
  };
}

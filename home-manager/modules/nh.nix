{ pkgs, lib, config, ... }: {

  options = {
    nhMod = lib.mkEnableOption "enables nhMod";
  };

  config = lib.mkIf config.nhmod {
    programs.nh = {
      enable = true;
      clean.enable = true;
      flake = "/etc/nixos";
      useSudo = true;
      nixosProfile = "nixos-desktop";
    };
  };
}

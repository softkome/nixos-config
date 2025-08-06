{ pkgs, lib, config, ... }: {

  options = {
    nhMod = lib.mkEnableOption "enables nhMod";
  };

  config = lib.mkIf config.nhMod {
    programs.nh = {
      enable = true;
      clean.enable = true;
      flake = "/etc/nixos";
    };
  };
}

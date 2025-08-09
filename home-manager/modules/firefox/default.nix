{ lib, config, pkgs, ... }:

{
  options = {
    firefoxMod = lib.mkEnableOption "Enables hardened Firefox with preconfigured profile";
  };

  config = lib.mkIf config.firefoxMod {
    home.packages = with pkgs; [
      firefox-bin
    ];

    home.file = {
      # Hardened profile user.js
      ".mozilla/firefox/hardened-profile/user.js".source =
        ./user.js;

      # Optional: extensions (uncomment to enable)
      # ".mozilla/firefox/hardened-profile/extensions/uBlock0@raymondhill.net.xpi".source =
      #   ./extensions/uBlock0.xpi;

      # Make hardened profile default
      ".mozilla/firefox/profiles.ini".text = ''
        [Profile0]
        Name=Hardened
        IsRelative=1
        Path=hardened-profile
        Default=1
      '';
    };
  };
}


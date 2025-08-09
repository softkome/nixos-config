{ lib, config, pkgs, ... }:

{
  options = {
    firefoxMod = lib.mkEnableOption "Enables hardened Firefox with preconfigured profile and matching UI theme";
  };

  config = lib.mkIf config.firefoxMod {
    home.packages = with pkgs; [
      firefox-bin
    ];

    home.file = {
      # Hardened profile user.js
      ".mozilla/firefox/hardened-profile/user.js".source =
        ./user.js;

      # Matching UI userChrome.css
      ".mozilla/firefox/hardened-profile/chrome".source =
        ./chrome;

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


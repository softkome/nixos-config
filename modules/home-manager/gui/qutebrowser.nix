{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.features.gui.browser.qutebrowser;
in {
  config = lib.mkIf cfg.enable {
    programs.qutebrowser = {
      enable = true;
      searchEngines = {
        google = "https://www.google.com/search?hl=en&q={}";
      };
    };
  };
}

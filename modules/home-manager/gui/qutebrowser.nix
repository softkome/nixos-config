{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.features.gui.browser.qutebrowser;
  gruvbox = {
    bg0 = "#282828";
    bg1 = "#3c3836";
    bg2 = "#504945";
    bg3 = "#665c54";

    fg0 = "#fbf1c7";
    fg1 = "#ebdbb2";
    fg2 = "#d5c4a1";

    red    = "#cc241d";
    green  = "#98971a";
    yellow = "#d79921";
    blue   = "#458588";
    purple = "#b16286";
    aqua   = "#689d6a";
    orange = "#d65d0e";
    gray   = "#928374";
  };
in {
  config = lib.mkIf cfg.enable {
    programs.qutebrowser = {
    enable = true;

    # Always explicit, no autoconfig
    loadAutoconfig = false;

    searchEngines = {
      DEFAULT = "https://www.startpage.com/sp/search?query={}";
    };

    settings = {
      url.default_page =
        "./startpage.html";
      url.start_pages =
        "./startpage.html";

      tabs.last_close = "startpage";
      scrolling.bar = "when-searching";

      colors.webpage.preferred_color_scheme = "dark";

      completion.height = "40%";
      completion.open_categories = [
        "searchengines"
        "bookmarks"
        "history"
        "quickmarks"
        "filesystem"
      ];

      content = {
        blocking = {
          method = "adblock";
          adblock.lists = [
            "https://easylist.to/easylist/easylist.txt"
            "https://easylist.to/easylist/easyprivacy.txt"
            "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt"
            "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt"
            "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt"
          ];
        };

        javascript.clipboard = "access-paste";
      };

      input.mode_override = "normal";
      keyhint.delay = 0;
      downloads.location.prompt = false;
    };

    extraConfig = ''
      palette = {
        "background": "${gruvbox.bg0}",
        "background-alt": "${gruvbox.bg1}",
        "border": "${gruvbox.bg1}",
        "selection": "${gruvbox.bg2}",
        "foreground": "${gruvbox.fg1}",
        "foreground-alt": "${gruvbox.gray}",
        "red": "${gruvbox.red}",
        "green": "${gruvbox.green}",
        "yellow": "${gruvbox.yellow}",
        "orange": "${gruvbox.orange}",
        "blue": "${gruvbox.blue}",
        "purple": "${gruvbox.purple}",
        "cyan": "${gruvbox.aqua}",
      }

      padding = {
        "top": 1,
        "right": 1,
        "bottom": 1,
        "left": 1,
      }

      c.colors.completion.category.bg = palette["background"]
      c.colors.completion.category.border.bottom = palette["border"]
      c.colors.completion.category.border.top = palette["border"]
      c.colors.completion.category.fg = palette["foreground"]

      c.colors.completion.even.bg = palette["background"]
      c.colors.completion.odd.bg = palette["background-alt"]
      c.colors.completion.fg = palette["foreground"]

      c.colors.completion.item.selected.bg = palette["selection"]
      c.colors.completion.item.selected.border.bottom = palette["selection"]
      c.colors.completion.item.selected.border.top = palette["selection"]
      c.colors.completion.item.selected.fg = palette["foreground"]

      c.colors.completion.match.fg = palette["orange"]
      c.colors.completion.scrollbar.bg = palette["background"]
      c.colors.completion.scrollbar.fg = palette["foreground"]

      c.colors.downloads.bar.bg = palette["background"]
      c.colors.downloads.error.bg = palette["background"]
      c.colors.downloads.error.fg = palette["red"]
      c.colors.downloads.stop.bg = palette["background"]
      c.colors.downloads.system.bg = "none"

      c.colors.hints.bg = palette["background"]
      c.colors.hints.fg = palette["selection"]
      c.colors.hints.match.fg = palette["foreground-alt"]
      c.hints.border = "1px solid " + palette["background-alt"]

      c.colors.keyhint.bg = palette["background"]
      c.colors.keyhint.fg = palette["purple"]
      c.colors.keyhint.suffix.fg = palette["selection"]

      c.colors.messages.error.bg = palette["background"]
      c.colors.messages.error.border = palette["background-alt"]
      c.colors.messages.error.fg = palette["red"]

      c.colors.messages.info.bg = palette["background"]
      c.colors.messages.info.border = palette["background-alt"]
      c.colors.messages.info.fg = palette["foreground-alt"]

      c.colors.messages.warning.bg = palette["background"]
      c.colors.messages.warning.border = palette["background-alt"]
      c.colors.messages.warning.fg = palette["red"]

      c.colors.prompts.bg = palette["background"]
      c.colors.prompts.border = "1px solid " + palette["background-alt"]
      c.colors.prompts.fg = palette["cyan"]
      c.colors.prompts.selected.bg = palette["selection"]

      c.colors.statusbar.normal.bg = palette["background"]
      c.colors.statusbar.normal.fg = palette["foreground"]

      c.colors.statusbar.command.bg = palette["background"]
      c.colors.statusbar.command.fg = palette["purple"]

      c.colors.statusbar.insert.bg = palette["background"]
      c.colors.statusbar.insert.fg = palette["foreground"]

      c.colors.statusbar.private.bg = palette["background-alt"]
      c.colors.statusbar.private.fg = palette["foreground-alt"]

      c.colors.statusbar.url.error.fg = palette["red"]
      c.colors.statusbar.url.success.http.fg = palette["green"]
      c.colors.statusbar.url.success.https.fg = palette["green"]
      c.colors.statusbar.url.warn.fg = palette["yellow"]
      c.colors.statusbar.url.hover.fg = palette["cyan"]

      c.statusbar.padding = padding

      c.colors.tabs.bar.bg = palette["background"]
      c.colors.tabs.even.bg = palette["background"]
      c.colors.tabs.odd.bg = palette["background"]
      c.colors.tabs.even.fg = palette["foreground"]
      c.colors.tabs.odd.fg = palette["foreground"]

      c.colors.tabs.selected.even.bg = palette["green"]
      c.colors.tabs.selected.even.fg = palette["background"]
      c.colors.tabs.selected.odd.bg = palette["green"]
      c.colors.tabs.selected.odd.fg = palette["background"]

      c.colors.tabs.indicator.error = palette["red"]
      c.colors.tabs.indicator.start = palette["orange"]
      c.colors.tabs.indicator.stop = palette["green"]
      c.colors.tabs.indicator.system = "none"

      c.tabs.padding = padding
      c.tabs.indicator.width = 1
      c.tabs.favicons.scale = 1
    '';
  };
  };
}

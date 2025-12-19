{
  lib,
  config,
  assetsDir,
  ...
}: let
  cfg = config.features.ui.bar.waybar;
in {
  config = lib.mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      style = ./style.css;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          modules-left = ["hyprland/workspaces"];
          modules-center = ["hyprland/window"];
          modules-right = ["custom/microphone" "pulseaudio" "network" "custom/power" "clock" "tray"];
          "hyprland/workspaces" = {
            disable-scroll = true;
            show-special = true;
            special-visible-only = true;
            all-outputs = false;
            format = "{icon}";
            format-icons = {
              "1" = "一";
              "2" = "二";
              "3" = "三";
              "4" = "四";
              "5" = "五";
            };

            persistent-workspaces = {
              "*" = 5;
            };
          };

          "hyprland/window" = {
            format = "[ {title} ]";
          };

          "custom/power" = {
            format = "<span size='large'>⏻</span>";
            on-click = "${assetsDir}/scripts/power-menu.sh";
            tooltip = false;
          };

          "network" = {
            format-wifi = "󰤨 {essid}";
            format-ethernet = "󰈀 Wired";
            format-disconnected = "󰤮 Disconnected";
            format-alt = "󰇚 {bandwidthDownBits} 󰕒 {bandwidthUpBits}";
            tooltip-format = "Interface: {ifname}\nIP: {ipaddr}\nSignal: {signalStrength}%";
            tooltip-format-ethernet = "Interface: {ifname}\nIP: {ipaddr}";
            tooltip-format-disconnected = "No connection";
            interval = 2;
          };

          "custom/microphone" = {
            exec = "${assetsDir}/scripts/microphone.sh";
            return-type = "json";
            interval = 30;
            format = "{}";
            on-click = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
            tooltip = true;
          };

          "pulseaudio" = {
            format = "{icon} {volume}%";
            format-bluetooth = "{icon} {volume}% ";
            format-muted = "";
            format-icons = {
              "headphones" = "";
              "handsfree" = "";
              "headset" = "";
              "phone" = "";
              "portable" = "";
              "car" = "";
              "default" = ["" ""];
            };
            on-click = "pavucontrol";
          };

          "clock" = {
            format = "{:%d.%m.%Y | %H:%M}";
            format-alt = "{:%A, %B %d at %R}";
            tooltip = false;
            tooltip-format = "<big>{:%B %Y}</big>\n<tt>{calendar}</tt>";
            calendar = {
              mode = "month";
              weeks = true;
            };
          };

          "tray" = {
            icon-size = 14;
            spacing = 2;
          };
        };
      };
    };
  };
}

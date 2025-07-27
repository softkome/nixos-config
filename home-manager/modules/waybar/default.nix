{ lib, config, ... }: {

  options = {
    waybarMod = lib.mkEnableOption "enables waybarMod";
  };

  config = lib.mkIf config.waybarMod {
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
              "1" = "1"; 
              "2" = "2";
              "3" = "3";
              "4" = "4";
              "5" = "5";
              "magic" = "";
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
	    on-click = "/etc/nixos/home-manager/modules/assets/power-menu.sh";
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
            exec = "/etc/nixos/home-manager/modules/assets/microphone.sh";
            return-type = "json";
            interval = 1;
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

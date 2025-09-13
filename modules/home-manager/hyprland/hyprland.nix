{ lib, config, pkgs, ... }:
let
  cfg = config.components.hyprland;
  colors = builtins.fromJSON (builtins.readFile (pkgs.runCommand "base16.json" {} ''
    ${pkgs.yq-go}/bin/yq eval -o=json ${../../../assets/colours/gruvbox.yaml} > $out
  ''));
in
  {
    config = lib.mkIf cfg {
      wayland.windowManager.hyprland = {
        enable = true;
	systemd.enable = true;
	settings = {
	  env = [
	    "NIXOS_OZONE_WL=1"
	    "XDG_CURRENT_DESKTOP=Hyprland"
	    "XDG_SESSION_TYPE=wayland"
	    "XDG_SESSION_DESKTOP=Hyprland"
	    "QT_QPA_PLATFORM=wayland"
	  ];

	  monitor = ",1920x1080@75,auto,1";

	  # Binds variables
	  "$mainMod" = "SUPER";
	  "$terminal" = "alacritty";
	  "$fileManager" = "$terminal -e sh -c 'ranger'";
	  "$menu" = "fuzzel";

	  exec-once = [
	    "[[ $(pgrep - waybar) ]] || waybar"
	    "wl-paste --type text --watch cliphist store"
	    "wl-paste --type image --watch cliphist store"
	  ];

	  general = {
	    gaps_in = 0;
	    gaps_out = 0;
	    border_size = 2;
	    "col.active_border" = "rgba(${colors.base06}ff)";
	    "col.inactive_border" = "rgba(${colors.base01}ff)";
	    resize_on_border = true;
	    allow_tearing = false;
	    layout = "master";
	  };

	  decoration = {
	    rounding = 0;
	    active_opacity = 1.0;
	    inactive_opacity = 1.0;
	    shadow = {
	      enabled = false;
	    };
	    blur = {
	      enabled = false;
	    };
	  };

	  animations = {
	    enabled = false;
	  };

	  master = {
	    new_status = "slave";
	    new_on_top = true;
	    mfact = 0.5;
	  };

	  misc = {
	    force_default_wallpaper = 0;
	    disable_hyprland_logo = true;
	  };

	  windowrulev2 = [
	    "workspace 3,class:(vesktop)"
	    "workspace 2,class:(steam)"
	    "workspace 2,class:(steam_app_.*)"
	    
	    "suppressevent maximize,class:.*"
	    "opacity 0.0 override, class:^(xwaylandvideobridge)$"
            "noanim, class:^(xwaylandvideobridge)$"
            "noinitialfocus, class:^(xwaylandvideobridge)$"
            "maxsize 1 1, class:^(xwaylandvideobridge)$"
            "noblur, class:^(xwaylandvideobridge)$"
            "nofocus, class:^(xwaylandvideobridge)$"
	  ];
	};
      };
    };
  }

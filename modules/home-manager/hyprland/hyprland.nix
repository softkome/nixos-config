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
	  cursor = {
	    no_hardware_cursors = false;
	  };

	  env = [
	    "NIXOS_OZONE_WL=1"
	    "XDG_CURRENT_DESKTOP=Hyprland"
	    "XDG_SESSION_TYPE=wayland"
	    "XDG_SESSION_DESKTOP=Hyprland"
	    "QT_QPA_PLATFORM=wayland"
	    "AQ_NO_EXPLICIT_SYNC=1"
	  ];

	  monitor = ",1920x1080@75,auto,1";

	  # Binds variables
	  "$mainMod" = "SUPER";
	  "$terminal" = "foot";
	  "$fileManager" = "$terminal -e sh -c 'ranger'";
	  "$menu" = "fuzzel";

	  exec-once = [
	    "[[ $(pgrep - waybar) ]] || waybar"
	    "wl-paste --type text --watch cliphist store"
	    "wl-paste --type image --watch cliphist store"

	    "swww-daemon"
	  ];

	  general = {
	    gaps_in = 0;
	    gaps_out = 0;
	    border_size = 0;
	    "col.active_border" = "rgba(${colors.base06}ff)";
	    "col.inactive_border" = "rgba(${colors.base01}ff)";
	    resize_on_border = true;
	    allow_tearing = false;
	    layout = "master";
	  };

	  decoration = {
	    rounding = 0;
	    active_opacity = 1.0;
	    inactive_opacity = 0.9;
	    shadow = {
	      enabled = false;
	    };
	    blur = {
	      enabled = false;
	    };
	  };

	  animations = {
	    enabled = false;
	    bezier = "easeOut, 0.25, 1, 0.5, 1";
	    animation = [
	      "windows, 1, 3, easeOut"
              "windowsMove, 1, 3, easeOut"
              "border, 1, 3, easeOut"
              "fade, 1, 4, easeOut"
              "workspaces, 1, 3, easeOut"
              "layers, 1, 3, easeOut"
              "specialWorkspace, 1, 3, easeOut"
	    ];
	  };

	  master = {
	    new_status = "slave";
	    new_on_top = true;
	    mfact = 0.5;
	  };

	  misc = {
	    vfr = true;
	    force_default_wallpaper = 0;
	    disable_hyprland_logo = true;
	  };

	  windowrulev2 = [
	    "workspace 3,class:(vesktop)"
	    "workspace 2,class:(steam)"
	    "workspace 2,class:(steam_app_.*)"

	    "float, class:foot"
	    "size 1100 650, class:foot"
	    
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

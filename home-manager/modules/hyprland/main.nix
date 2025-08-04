{ lib, config, ... }: {

  options = {
    hyprlandMod = lib.mkEnableOption "enables hyprlandMod";
  };

  config = lib.mkIf config.hyprlandMod {
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
          "XDG_SCREENSHOTS_DIR=$HOME/screens"
        ];
  
        monitor = ",1920x1080@75,auto,1";
        "$mainMod" = "SUPER";
        "$terminal" = "alacritty";
        "$fileManager" = "$terminal -e sh -c 'ranger'";
        "$menu" = "fuzzel";
  
        exec-once = [
          "[[ $(pgrep -x waybar) ]] || waybar"
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
        ];
  
        general = {
          gaps_in = 0;
          gaps_out = 0;
  
          border_size = 5;
  
          "col.active_border" = "rgba(EBDBB2ff)";
          "col.inactive_border" = "rgba(3c3836ff)";
  
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
  
        input = {
          kb_layout = "us,ru,il";
          # kb_options = "grp:caps_toggle";
        };
  
        gestures = {
          workspace_swipe = true;
          workspace_swipe_invert = false;
          workspace_swipe_forever	= true;
        };
  
        dwindle = {
          pseudotile = true;
          preserve_split = true;
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
          "bordersize 0, floating:0, onworkspace:w[t1]"
  
          "workspace 3,class:(vesktop)"
	  "workspace 2,class:(steam)"
        
          "suppressevent maximize, class:.*"
          "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
  
          "opacity 0.0 override, class:^(xwaylandvideobridge)$"
          "noanim, class:^(xwaylandvideobridge)$"
          "noinitialfocus, class:^(xwaylandvideobridge)$"
          "maxsize 1 1, class:^(xwaylandvideobridge)$"
          "noblur, class:^(xwaylandvideobridge)$"
          "nofocus, class:^(xwaylandvideobridge)$"
        ];
  
        workspace = [
          "w[tv1], gapsout:0, gapsin:0"
          "f[1], gapsout:0, gapsin:0"
        ];
      };
    };
  };
}

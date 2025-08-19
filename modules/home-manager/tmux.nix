{ lib, config, pkgs, ... }:
let
  cfg = config.components.tmux;
in
  {
    config = lib.mkIf cfg {
      programs.tmux = {
        enable = true;
        baseIndex = 1;
        mouse = true;
        escapeTime = 0;
        keyMode = "vi";
        terminal = "screen-256color";
  
        extraConfig = lib.concatStringsSep "\n" [
  
          # Terminal features and reload
          ''
          set -as terminal-features ",alacritty*:RGB"
          bind -n M-r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"
          ''
  
          # Pane and window navigation
          ''
          bind C-p previous-window
          bind C-n next-window
          ${lib.concatStringsSep "\n" (builtins.genList (i:
            let n = toString (i + 1); in
            "bind -n M-${n} select-window -t ${n}"
          ) 9)}
  
          bind -n M-Left  select-pane -L
          bind -n M-Right select-pane -R
          bind -n M-Up    select-pane -U
          bind -n M-Down  select-pane -D
  
          bind -n M-S-Left  resize-pane -L 5
          bind -n M-S-Right resize-pane -R 5
          bind -n M-S-Up    resize-pane -U 3
          bind -n M-S-Down  resize-pane -D 3
  
          bind -n M-s split-window -v
          bind -n M-v split-window -h
  
          bind -n M-Enter new-window
          bind -n M-c kill-pane
          bind -n M-q kill-window
          bind -n M-Q kill-session
          ''
  
          # Gruvbox-style status bar
          ''
          # Base colors:
          # BG:    #282828
          # FG:    #a89984
          # Accent:#ebdbb2 (highlight)
          # Gray:  #928374
  
          set -g status on
          set -g status-interval 1
          set -g status-justify left
          set -g status-style "bg=#282828,fg=#a89984"
  
          set -g status-left-length 50
          set -g status-left "#[bg=#282828,fg=#ebdbb2,bold] #S #[default]"
  
          set -g status-right-length 100
          set -g status-right "#[fg=#ebdbb2] %Y-%m-%d %H:%M #[default]"
  
          setw -g window-status-current-style "bg=#282828,fg=#ebdbb2,bold"
          setw -g window-status-current-format " #I:#W "
  
          setw -g window-status-style "bg=#282828,fg=#928374"
          setw -g window-status-format " #I:#W "
  
          setw -g window-status-separator ""
          ''
        ];
  
        plugins = with pkgs; [ ];
      };
    };
  }

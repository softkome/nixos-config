{
  lib,
  config,
  ...
}: let
  cfg = config.features.cli.shell.fish;
in {
  config = lib.mkIf cfg.enable {
    programs.fish = {
      enable = true;
      shellInit = ''
        function fish_greeting
          microfetch-custom
        end

        alias r ranger
        alias v nvim
        alias se sudoedit
        alias c clear
        alias .. "cd .."
        alias cm "c && microfetch-custom"

        # Start Tmux automatically if not allready running. No Tmux is TTY
        if test -z "$TMUX" -a -n "$DISPLAY"
          tmux attach-session -t default; or tmux new-session -s default
        end

        # Start UWSM
        if uwsm check may-start > /dev/null && uwsm select
          exec systemd-cat -t uwsm_start uwsm start default
        end

        starship init fish | source
      '';
    };
  };
}

{ lib, config, ... }: {

  options = {
    fishMod = lib.mkEnableOption "enables fishMod";
  };
    
  config = lib.mkIf config.fishMod {
    programs.fish = {
      enable = true;
      shellInit = ''
        function fish_greeting
	  fastfetch
	end
 
	alias r ranger
	alias v nvim
  	alias se sudoedit
	alias microfetch "command microfetch; echo"
  	alias c clear
	alias .. "cd .."
	alias hm "cd ~/nixos-config/home-manager/modules"
	alias nx "cd ~/nixos-config"


        # Start Tmux automatically if not already running. No Tmux in TTY
        if test -z "$TMUX" -a -n "$DISPLAY"
          tmux attach-session -t default; or tmux new-session -s default
        end
  
        # Start UWSM (adjust command if needed for Fish syntax)
        if uwsm check may-start > /dev/null && uwsm select
          exec systemd-cat -t uwsm_start uwsm start default
        end

	starship init fish | source
      '';
    };
  };
}

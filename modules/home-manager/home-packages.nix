{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    imv # image viewer
    mpv # media player
    pavucontrol # volume control
    librewolf # firefox browser
    #brave # chromium browser
    vesktop # discord
    xfce.thunar # gui file manager
    #stremio # streaming service

    bottom # system monitor
    htop # process monitor
    brightnessctl # brightness control
    cliphist # clipboard history
    ffmpeg # multimedia tool
    fzf # fuzzy finder
    grimblast # wayland screenshots
    hyprpicker # colour picker
    ntfs3g # NTFS driver support
    playerctl # media control scripts
    ripgrep # text search
    ueberzugpp # terminal image viewing
    unzip # basic extraction
    unrar # rar extraction
    wget # file downloads
    wl-clipboard # clipboard
    zip # archiving
 
    libnotify # notifications
    nix-prefetch-scripts # nix packaging

    steam # game launcher
    gamescope # game performance
    gamemode # game performance
    protonup-ng # proton installs
    mangohud # performance overlay
  ];
}

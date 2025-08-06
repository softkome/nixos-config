{ pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    #desktop apps
    librewolf #browser
    imv #image viewer
    mpv #video player
    obs-studio #recording software
    pavucontrol #volume control
    vesktop #discord
    stremio #steaming software
    steam #game launcher
    gamescope #game optimization
    gamemode #game optimization
    xfce.thunar #gui file manager
    aseprite #pixel art
    

    #cli utils
    bc #calculator
    bottom #system monitor
    brightnessctl #brightness control
    cliphist #clipboard manager
    ffmpeg #multimedia framework
    ffmpegthumbnailer #video thumbnailer
    fzf #fuzzy finder
    grimblast #screenshot helper
    htop #process viewer
    hyprpicker #colour picker
    ntfs3g #ntfs driver
    mediainfo #media information
    microfetch #fetch
    playerctl #media controler
    ripgrep #text search
    udisks #disk management
    ueberzugpp #terminal image viewer
    unzip #extract .zip
    unrar #extract .rar
    wget #file downloader
    wl-clipboard #wayland clipboard
    wtype #wayland keyboard typer
    zip #zip archiver
    cava #audio visulliser
    cmatrix #matrix effect
    cbonsai #bonsai tree
    nh #nix helper

    #wm stuff
    libsForQt5.xwaylandvideobridge #video sharing bridge
    libnotify #notification daemon
    xdg-desktop-portal-gtk #gtk portal backend
    xdg-desktop-portal-hyprland #hyprland portal backend

    #other
    bemoji #emoji picker
    nix-prefetch-scripts #nix fetch scripts
    protonup-ng #proton installer
    mangohud #performance overlay
  ];
}

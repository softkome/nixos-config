{ user, homeStateVersion, ... }:

{
  imports = [
    ../../home-manager/home-packages.nix
    ../../home-manager/modules
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  home.sessionVariables = {
    TEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\\\${HOME}/.steam/root/compatibilitytools.d";
  };

  # cli / tui tools
  tmuxMod.enable = true;
  rangerMod.enable = true;
  fishMod = true;
  gitMod.enable = true;
  neovimMod = true;
  starshipMod.enable = true;
  envMod = true;
  ezaMod = true;
  batMod = true;
  fastfetchMod = true;


  # gui / desktop enviroment
  zathuraMod.enable = true;
  alacrittyMod = true;
  stylixMod = true;

  # wayland / hyprland
  hyprlandMod = true;
  hyprlockMod = true;
  hypridleMod = true;
  hyprpaperMod = true;
  waybarMod = true;
  swayncMod = true;
  fuzzelMod = true;
}

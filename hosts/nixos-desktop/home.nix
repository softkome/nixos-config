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

  tmuxMod.enable = true;
  zathuraMod.enable = true;
  rangerMod.enable = true;
  fishMod = true;
  gitMod.enable = true;
  neovimMod = true;
  starshipMod.enable = true;
  envMod = true;
  ezaMod = true;
  chromiumMod = true;
  alacrittyMod = true;
  batMod = true;
  stylixMod = true;
  fastfetchMod = true;
  waybarMod = true;
  swayncMod = true;
  fuzzelMod = true;
  hyprlandMod = true;
  hyprlockMod = true;
  hypridleMod = true;
  hyprpaperMod = true;
}

{
  config,
  pkgs,
  lib,
  user,
  shell ? "bash",
  ...
}: let
  userShell =
    if builtins.elem shell ["bash" "fish" "zsh"]
    then shell
    else "bash";
in {
  programs = {
    fish.enable = lib.mkIf (userShell == "fish") true;
    zsh.enable = lib.mkIf (userShell == "zsh") true;
  };

  users.users.${user} = {
    isNormalUser = true;
    description = "${user}User";
    extraGroups = ["wheel" "networkmanager" "audio" "video"];
  };
}

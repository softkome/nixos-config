{ pkgs, user, ... }: {
  users.users.softkome = {
    isNormalUser = true;
    description = "Softkome User";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = "${pkgs.fish}/bin/fish";
  };

  services.getty.autologinUser = "softkome"; 
}

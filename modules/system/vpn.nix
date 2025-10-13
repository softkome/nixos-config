{pkgs, assetsDir, ... }: {
  environment.systemPackages = with pkgs; [openvpn];

  services.openvpn.servers = {
    protonvpn = {
      configFile = "config ${assetsDir}/nixosvpn.ovpn" ;
      autoStart = false;
      updateResolvConf = true;
    };
  };
}

{ pkgs, assetsDir, ... }: {
  environment.systemPackages = with pkgs; [ openvpn ];

  services.openvpn.servers = {
    protonvpn = {
      config = ''config ${assetsDir}/nixosvpn.ovpn'';
      autoStart = false;
      updateResolvConf = true;
    };
  };
}


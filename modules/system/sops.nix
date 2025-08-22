{ user, config, ... }: {
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age = {
      keyFile = "/home/${user}/.config/sops/age/keys.txt";
    };
    secrets = {
      "git/userName" = {};
      "git/userEmail" = {};
    };
    
    # Add this template
    templates."git-config" = {
      content = ''
        [user]
          name = ${config.sops.placeholder."git/userName"}
          email = ${config.sops.placeholder."git/userEmail"}
      '';
      owner = user;
      group = "users";
      mode = "0400";
    };
  };
}

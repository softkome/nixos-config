{ user, ...}: {
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age = {
      keyFile = "/home/${user}/.config/sops/age/keys.txt";
    };

    secrets = {
      "git/userName" = {
        owner = user;
	group = "users";
	mode = "0400";
      };
      "git/userEmail" = {
        owner = user;
	group = "users";
	mode = "0400";
      };
    };
  };
}

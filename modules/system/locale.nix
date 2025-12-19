{
  time.timeZone = "Europe/London";
  console.keyMap = "us";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ALL = "en_GB.UTF-8";
    };
  };
}

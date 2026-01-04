{
  pkgs,
  assetsDir,
  ...
}: {
  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${assetsDir}/colours/custom2.yaml";
  };
}

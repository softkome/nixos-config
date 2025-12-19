{
  pkgs,
  kernel ? "latest",
  ...
}: {
  boot.kernelPackages = pkgs."linuxPackages_${kernel}";
}

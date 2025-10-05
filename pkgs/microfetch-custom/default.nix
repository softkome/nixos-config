{ pkgs ? import <nixpkgs> {} }:

pkgs.rustPlatform.buildRustPackage {
  pname = "microfetch-custom";
  version = "1.0.0";

  src = ./.;

  cargoLock.lockFile = ./Cargo.lock;

  meta = with pkgs.lib; {
    description = "A custom minimal system fetch tool";
    license = licenses.mit;
    maintainers = [ maintainers.yourname ];
    platforms = platforms.linux;
  };
}


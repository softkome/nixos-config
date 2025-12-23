let
  # Check that required packages exist
  depsEnabled = builtins.hasAttr "fuzzel" pkgs && builtins.hasAttr "swww" pkgs;

  set-wallpaper = lib.mkIf depsEnabled (pkgs.writeShellScriptBin "set-wallpaper" ''
    #!/usr/bin/env bash

    WALLPAPER_DIR="$HOME/wallpapers"

    # Find all images in the wallpaper directory
    selected=$(
      find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) \
      | ${pkgs.fuzzel}/bin/fuzzel -d --prompt "Select wallpaper:"
    )

    # Exit if nothing selected
    [ -z "$selected" ] && exit 0

    # Set the wallpaper with swww, using a smooth fade transition
    ${pkgs.swww}/bin/swww img "$selected" --transition-type fade --transition-duration 1.0
  '');
in {
  home.packages = lib.optional depsEnabled set-wallpaper;
}


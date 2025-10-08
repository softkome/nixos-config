# softkome's Nixos Config

My personal Nixos Configuration

## Features

- modular structure
- themed with stylix
- secrets with sops-nix
- multible hosts

## Structure

- `flake.nix` / `flake.lock` — entry point
- `hosts/` — machine-specific configs
- `modules/system/` — system level modules
- `modules/home-manager/` — user / home-manager modules
- `assets/` — wallpapers, scripts, base16colours, etc.

## Usage

### Clone the repo

```bash
git clone https://github.com/softkome/nixos-config ~/nixos-config
cd ~/nixos-config
```

### Configure host and user

Edit `flake.nix` and modify hosts configuration:

```nix
# Define hosts here
hosts = {
  "your-hostname" = {
    user = "your-username";
    hostname = "your-hostname";
    stateVersion = "25.05";
    autologin = true;
    shell = "fish";  # or "bash", "zsh"
    kernel = "zen";  # or "latest" or "lts"
    extraModules = [ ./modules/window-managers/hyprland.nix ];
  };
};
```

Rename `hosts/desktop` > `hosts/your-hostname/...`

### Set up age encryption

Create age key for secrets management:

```bash
nix-shell -p sops age

# Make this directory if it doens't exist
age-keygen -o ~/.config/sops/age/keys.txt

# Make note of the public key
```

### Configure SOPS

Edit `.sops.yaml` and replace the example with your public key:

```yaml
keys:
  - &your-key age1your_public_key_here_replace_this_entire_string
creation_rules:
  - path_regex: secrets/.*\.yaml$
    key_groups:
    - age:
      - *your-key
```

### Create your secrets

Remove `secrets/secrets.yaml` and create your own:

```bash
rm secrets/secrets.yaml

sops secrets/secrets.yaml
```

Add your git username and email into secrets.yaml:

```yaml
git:
    userName: "Your Git Username"
    userEmail: "your.email@example.com"
```

### Rebuild

Initial rebuild:

```bash
sudo nixos-rebuild switch --flake ./#your-hostname
```

Future rebuilds:

```bash
nh os switch -H your-hostname /home/your-username/nixos-config
```

## Licences

This repository contains a mix of original code and modified third-party code.

- 'microfetch-custom' — Modified version of [Microfetch](https://github.com/NotAShelf/microfetch) Licensed under **GNU General Public License v3.0** (see `microfetch-custom/LICENSE`).
- Root configuration and original files — released under [CC0 1.0 Universal (Public Domain Dedication)](./LICENSE).

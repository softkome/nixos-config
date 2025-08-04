# softkome's NixOS Config

This is my personal NixOS configuration

## Features

- hyprland window manager
- stylix theming
- modular structure

## Structure

- `flake.nix` / `flake.lock` — entry point
- `hosts/` — machine-specific configs
- `home-manager/` — user-specific modules and packages
- `system-modules/` — common NixOS system modules

## Usage

Clone the repo:

```bash
git clone https://github.com/softkome/nixos-config ~/nixos-config
cd ~/nixos-config

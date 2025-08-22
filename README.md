# softkome's NixOS Configuration

A modular NixOS configuration with declarative system management, secrets handling, and multiple desktop environments.

## Quick Start

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd nixos-configuration
```

### 2. Configure Your Host

Edit `flake.nix` and modify the hosts configuration:

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

Replace:
- `"your-hostname"` with your desired hostname
- `"your-username"` with your username
- Adjust `shell`, `kernel`, and `extraModules` as needed

### 3. Set Up Age Encryption

Create an age key for secrets management:

```bash
# Install age if not already installed
nix-shell -p age

# Generate a new age key
age-keygen -o ~/.config/sops/age/keys.txt

# Display your public key (you'll need this for the next step)
age-keygen -y ~/.config/sops/age/keys.txt
```

### 4. Configure SOPS

Edit `.sops.yaml` and replace the example key with your public age key:

```yaml
keys:
  - &your-key age1your_public_key_here_replace_this_entire_string
creation_rules:
  - path_regex: secrets/.*\.yaml$
    key_groups:
    - age:
      - *your-key
```

**Important**: Replace `age1your_public_key_here_replace_this_entire_string` with the public key output from the previous step.

### 5. Create Your Secrets

Delete the existing secrets file and create your own:

```bash
# Remove the existing secrets file
rm secrets/secrets.yaml

# Create your own secrets file
sops secrets/secrets.yaml
```

Add your Git configuration to the secrets file:

```yaml
git:
    userName: "Your Git Username"
    userEmail: "your.email@example.com"
```

Save and exit the SOPS editor.

### 6. Initial System Build

Perform the initial system rebuild:

```bash
sudo nixos-rebuild switch --flake ./#your-hostname
```

Replace `your-hostname` with the hostname you configured in step 2.

### 7. Future Rebuilds

For faster future rebuilds, use `nh` (NixOS Helper):

```bash
nh os switch -H your-hostname /home/your-username/nixos-configuration
```

Replace:
- `your-hostname` with your configured hostname
- `your-username` with your username

## Configuration Options

### Available Kernels
- `zen` - Zen kernel (performance optimized)
- `latest` - Latest stable kernel
- `lts` - Long-term support kernel

### Available Shells
- `fish` - Fish shell (default)
- `bash` - Bash shell
- `zsh` - Zsh shell

### Window Managers/Desktop Environments
Available modules in `./modules/window-managers/`:
- `hyprland.nix` - Hyprland (Wayland compositor)
- Add your own modules as needed



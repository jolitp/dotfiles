# Nix / NixOS commands list

## Flakes

### Rebuild flake configuration

In the `dotfiles` directory:

```bash
sudo nixos-rebuild switch --flake .
```

### Update package versions in the `flake.lock` file

```bash
nix flake update
```

### Update package versions in the `flake.lock` file & reabuild the system

```bash
nix flake update && sudo nixos-rebuild switch --flake .
```

## Home manager

### Rollback home manager configurations

#### List generations

```bash
home-manager generations
```

To get a list of all the home manager generations, with their respective Nix store paths.

```bash
/nix/store/<hash>-home-manager-generation/activate
```

Adding `/activate` at the end of the path.


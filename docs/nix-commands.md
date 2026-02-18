# Nix / NixOS commands list

## Flakes

### Rebuild flake configuration

In the `dotfiles` directory:

```bash
sudo nixos-rebuild switch --flake .
```

<<<<<<< HEAD
Or anywhere:

```bash
sudo nixos-rebuild switch --flake ~/dotfiles
=======
```bash
sudo nixos-rebuild switch --flake ~/dotfiles/
>>>>>>> b5f4889 (adds things to pc)
```

### Update package versions in the `flake.lock` file

In the `dotfiles` directory:

```bash
nix flake update
```

### Update package versions in the `flake.lock` file & reabuild the system

In the `dotfiles` directory:

```bash
nix flake update && sudo nixos-rebuild switch --flake . && home-manager switch -b backup --flake ~/dotfiles
```

```bash
nix flake update && sudo nixos-rebuild switch --flake ~/dotfiles/
```

## Home manager

### Rebuild home configuration

```bash
home-manager switch -b backup --flake ~/dotfiles
```

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


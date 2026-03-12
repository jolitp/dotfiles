# default recipe to display available commands
default:
  just --choose

# Full Upgrade 
upgrade_all:
  sudo echo "Updating All Software Versions"
  nix flake update
  echo "Rebuilding System"
  sudo nixos-rebuild switch --flake ~/dotfiles
  echo "Rebuilding Home"
  home-manager switch -b backup --flake ~/dotfiles

# Update flake.lock file
update:
  sudo echo "Updating All Software Versions"
  nix flake update

# Switch to the new system configuration
rebuild_system:
  echo "Rebuilding System Configuration"
  sudo nixos-rebuild switch --flake ~/dotfiles

# Switch to the new home configuration
rebuild_home:
  echo "Rebuilding Home Configuration"
  home-manager switch -b backup --flake ~/dotfiles

# (NH) Switch to the new system configuration
sys:
  nh os switch

# (NH) Switch to the new home configuration
home:
  nh home switch

# check system build
test_sys:
  sudo nixos-rebuild switch --dry-run --flake ~/dotfiles

# check home build
test_home:
  home-manager switch --dry-run -b backup --flake ~/dotfiles

# collect garbage from the Nix Store
gc:
    nix-collect-garbage -d

# deduplicates the Nix store
optimize:
    nix store optimise

# gc + cleanup
cleanup:
    nix-collect-garbage -d
    nix store optimise

# Find why something is building
why pkg:
    nix why-depends . {{pkg}}

# show flake info
flake:
    nix flake show

# Track store size
store-size:
    du -sh /nix/store

# Diff current vs previous system generation
diff:
    nvd diff /run/current-system /nix/var/nix/profiles/system-1-link

# Diff two specific generations
diff-gen a b:
    nvd diff /nix/var/nix/profiles/system-{{a}}-link /nix/var/nix/profiles/system-{{b}}-link

# Diff current system vs newly built system (before switching)
diff-build:
    nix build .#nixosConfigurations.$(hostname).config.system.build.toplevel
    nvd diff /run/current-system ./result

# Diff Home Manager generations
diff-hm:
    nvd diff \
      ~/.local/state/nix/profiles/home-manager \
      ~/.local/state/nix/profiles/home-manager-1-link

# List generations
gens:
    sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

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
  sudo nixos-rebuild dry-build --flake ~/dotfiles

# check home build
test_home:
  home-manager switch --dry-run -b backup --flake ~/dotfiles

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
    nvd diff /run/current-system $(readlink -f /nix/var/nix/profiles/system-*-link | tail -n 2 | head -n 1)

# Diff two specific generations
diff-gen a b:
    nvd diff /nix/var/nix/profiles/system-{{a}}-link /nix/var/nix/profiles/system-{{b}}-link

# Diff current system vs newly built system (before switching)
diff-build:
    nix build .#nixosConfigurations.$(hostname).config.system.build.toplevel
    nvd diff /run/current-system ./result

# Diff current system vs newly built system (before switching) (dry-run)
# diff-preview:
#     drv=$$(nix build .#nixosConfigurations.$(hostname).config.system.build.toplevel --no-link --print-out-paths); \
#     nvd diff /run/current-system $$drv

host := `hostname`

# Diff current system vs newly built system (before switching) (dry-run)
diff-preview:
    nix build .#nixosConfigurations.laptop.config.system.build.toplevel --no-link --print-out-paths \
      | xargs -I{} nvd diff /run/current-system {}

# Diff Home Manager generations
diff-hm:
    nvd diff ~/.local/state/nix/profiles/home-manager ~/.local/state/nix/profiles/home-manager-$(($(ls ~/.local/state/nix/profiles | grep home-manager-[0-9]*-link | sed 's/[^0-9]//g' | sort -n | tail -n1)-1))-link

# finds every .nix file inside ~/dotfiles and formats them with alejandra.
fmt:
    find . -type f -name '*.nix' -print0 | xargs -0 alejandra

# Delete old system generations. Keep only the last 30 days
cleanup-system:
    sudo nix-collect-garbage --delete-older-than 30d

# Cleanup Home Manager generations. Keep only the last 30 days

cleanup-hm:
    home-manager expire-generations "-30 days"

# collect garbage from the Nix Store
gc:
    nix-collect-garbage -d

# deduplicates the Nix store
optimize:
    nix store optimise

# gc + cleanup
cleanup:
    just cleanup-system
    just cleanup-hm
    just optimise

# List generations from system
gens:
    sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

# List generations from home manager
hm-gens:
    home-manager generations


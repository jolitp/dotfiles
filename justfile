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








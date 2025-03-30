# Default Just
list:
  just --list
# Rebuild using Flakes
nix-flake:
  sudo nixos-rebuild switch --flake .#janpstrunn
# Update home-manager config
hm-switch:
  home-manager switch --flake .
# View home-manager generations
hm-gen:
  home-manager generations
# Update flake.lock
flake-update:
  nix flake update

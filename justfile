# Default Just
list:
  just --list

# Rebuild using Flakes
f-switch:
  sudo nixos-rebuild switch --flake .#janpstrunn

# Update flake.lock
f-update:
  nix flake update

# Update home-manager config
hm-switch:
  home-manager switch --flake .

# View home-manager generations
hm-gen:
  home-manager generations

# Update Channels
update:
  sudo nix flake update;
  sudo nix-channel --update;
  nix-channel --update;

# Pull
pull:
  git stash;
  git pull;
  git stash apply;

# Garbage Collect (7d)
garbage:
  nix-collect-garbage --delete-older-than 7d

alias fs := f-switch
alias hs := hm-switch

# Default Just
list:
  just --list

# Rebuild using Flakes
f-switch:
  sudo nixos-rebuild switch --flake .#janpstrunn

# Update flake.lock
f-update:
  nix flake update

# Rebuild Home Manager Config
hm-switch:
  home-manager switch --flake .

# View Home Manager Generations
hm-gen:
  home-manager generations

# Update Channels
update:
  sudo nix flake update;
  sudo nix-channel --update;
  nix-channel --update;

# Git Pull
pull:
  git stash;
  git pull;
  git stash apply;

# Garbage Collect (7d)
garbage:
  nix-collect-garbage --delete-older-than 7d

# Install Home Manager
hm-install:
  nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install

# Secure NextDNS Profile File
nextdns-harden:
  git update-index --assume-unchanged ./modules/system/nextdns-profile.nix

flatpak:
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

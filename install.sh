#!/usr/bin/env bash

set -euo pipefail

function help() {
  cat <<EOF
NixOS Installer

Usage:
  install.sh FLAG <FLAG_INPUT> COMMAND INPUT
  install.sh -h | install.sh help
  install.sh

Commands:
help                        Displays this message and exits

Flags:
-d                          Skip some installation steps (Use default config values)
-h                          Displays this message and exits
EOF
}

function replace_config() {
  local file="$1"
  local replacing="$2"
  local interactive="$3"

  if [ ! -f "$file" ] || [ ! -r "$file" ]; then
    echo "Error: File $file does not exist or is not readable." >&2
    exit 1
  fi

  mapfile -t options < <(sed -n "s/.*$replacing = \"[^\"]*\"; *# *\(.*\)/\1/p" "$file" | tr ',' '\n')

  if [ ${#options[@]} -eq 0 ]; then
    echo "Error: No $replacing options found in $file." >&2
    exit 1
  fi

  if [ "$interactive" -eq 1 ]; then
    echo "Select your $replacing:"
    select option in "${options[@]}"; do
      if [ -n "$option" ]; then
        break
      else
        echo "Invalid selection. Please try again."
      fi
    done
  else
    echo ">> Insert your $replacing:"
    echo "> Examples: ${options[@]}"
    read -r option
    if [ -z "$option" ]; then
      echo "Skipped $replacing"
      default=$(awk -F' = |"' "/$replacing/ {print \$3}" "$file")
      echo "Default value is: $default"
      echo
      return
    fi
  fi

  [ -z "$option" ] && echo "No selection made." && exit 1

  sed -i "s/\($replacing = \"\).*\(\"\)/\1$option\2/" "$file"

  echo "✅ Updated $replacing to \"$option\" in $file"
}

function bye() {
  cat <<EOF
Once you reboot you system, you will still need to install Home Manager and run it to install user-side software
You may run just in this repository with the following recipes:
- just hm-install # To install Home Manager
- just hm-switch # To run it
EOF
}

function welcome() {
  local choice
  cat <<EOF
 _   _ _       ___  ____
| \ | (_)_  __/ _ \/ ___|
|  \| | \ \/ / | | \___ \
| |\  | |>  <| |_| |___) |
|_| \_|_/_/\_\\___/|____/

This is an installer for my system which:
  - Keep things simple
  - Keep it easy to maintain
  - Lightweight system without sacrificing on visuals

This installer will:
  - Help you configure the system
  - Format your device and mount it
  - Install NixOS
  - Reboot

Warning: This is still in work-in-progress. Use with caution.
EOF
  read -p "Do you want to proceed? (Y/n) " choice
  if [ -z "$choice" ]; then
    choice=Y
  fi
  if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
    return
  else
    echo "Quitting..."
    exit 0
  fi
  echo
}

function setup_disk() {
  local disk_options=($HOME/nix/profiles/disks/*.nix)
  echo "Select a disk layout:"
  select disk_layout_option in "${disk_options[@]}"; do
    if [ -n "$disk_layout_option" ]; then
      break
    else
      echo "Invalid selection. Please try again."
    fi
  done

  local original_line="disks/ext4-luks.nix"
  local new_line="disks/$disk_layout_option"

  sed -i "s|${original_line}|${new_line}|" "flake.nix"

  echo "✅ Updated disk layout to \"$disk_layout_option\" in $file"
}

function main() {
  welcome
  if [ "$USE_DEFAULT" -eq 1 ]; then
    echo "Step 1 - Setting up System Settings - Skipped"
    echo "Step 2 - Setting up User Settings - Skipped"
  else
    echo "Step 1 - Setting up System Settings:"
    replace_config "flake.nix" "hostname" 0
    replace_config "flake.nix" "timezone" 0
    replace_config "flake.nix" "locale" 0
    replace_config "flake.nix" "extra_locale" 0
    replace_config "flake.nix" "keyboard" 0
    replace_config "flake.nix" "cups" 1
    echo "Step 2 - Setting up User Settings:"
    replace_config "flake.nix" "username" 0
    replace_config "flake.nix" "name" 0
    replace_config "flake.nix" "email" 0
    replace_config "flake.nix" "editor" 0
    replace_config "flake.nix" "displayManager" 0
    replace_config "flake.nix" "wm" 0
    replace_config "flake.nix" "term" 0
  fi
  echo "Step 3 - Selecting a profile"
  replace_config "flake.nix" "profile" 1
  echo "Step 4 - Enabling modules"
  echo "You'll now select what modules you want to enable in the home.nix and configuration.nix"
  echo "You may want to read each modules content in order to enable it or not"
  echo "Once you are done, just save the file"
  read -p "Enter anything to continue" proceed
  unset proceed
  default=$(awk -F' = |"' "/profile/ {print \$3}" "flake.nix" | head -n 1)
  vim "$HOME/nix/profiles/$default/home.nix"
  vim "$HOME/nix/profiles/$default/configuration.nix"
  echo "Step 5 - Selecting Disk Layout"
  setup_disk
  echo "Step 6 - Applying Disk Layout"
  sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount "$HOME/nix/profiles/disks/$disk_layout_option"
  echo "Step 7 - Updating Hardware Configuration"
  sudo nixos-generate-config --no-filesystems --root /mnt
  sudo mv -f "/mnt/etc/nixos/hardware-configuration.nix" "$HOME/nix/profiles/$default/"
  echo "Step 8 - Installing NixOS"
  sudo nixos-rebuild switch --flake .#janpstrunn && echo "Installation complete!"
  bye
  read -p "Do you want to reboot now? (Y/n)" reboot_now
  if [ "$reboot_now" == "Y" ] || [ "$reboot_now" == "y" ]; then
    reboot
  fi
}

while getopts ":hd" opt; do
  case "$opt" in
  h)
    help
    exit 0
    ;;
  d)
    USE_DEFAULT=1
    ;;
  ?)
    echo "Error: Invalid option '-$OPTARG'" >&2
    exit 1
    ;;
  esac
done

shift $((OPTIND - 1))

case "$1" in
help)
  help
  exit 0
  ;;
clone)
  git clone https://github.com/janpstrunn/nix $HOME/nix && main
  ;;
*)
  main
  ;;
esac

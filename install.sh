#!/usr/bin/env bash

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
  local default

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
      default=$(awk -F' = |"' "/$replacing/ {print \$3}" "$file" | head -n 1)
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

  disk_layout_option=$(basename $disk_layout_option)

  local original_line="disks/ext4-luks.nix"
  local new_line="disks/$disk_layout_option"

  sed -i "s|${original_line}|${new_line}|" "flake.nix"

  echo "✅ Updated disk layout to \"$disk_layout_option\" in $file"
}

function main() {
  if [ "$USE_DEFAULT" -ne 1 ]; then
    welcome
  fi

  if [ "$USE_DEFAULT" -ne 1 ]; then
    echo -e "\nStep 1 - Setting up System Settings:\n"
    replace_config "flake.nix" "hostname" 0
    replace_config "flake.nix" "timezone" 0
    replace_config "flake.nix" "locale" 0
    replace_config "flake.nix" "extra_locale" 0
    replace_config "flake.nix" "keyboard" 0
    replace_config "flake.nix" "cups" 1
    echo -e "\nStep 2 - Setting up User Settings:\n"
    replace_config "flake.nix" "username" 0
    replace_config "flake.nix" "name" 0
    replace_config "flake.nix" "email" 0
    replace_config "flake.nix" "editor" 0
    replace_config "flake.nix" "displayManager" 0
    replace_config "flake.nix" "wm" 0
    replace_config "flake.nix" "term" 0
  fi

  echo -e "\nStep 3 - Selecting a profile\n"
  replace_config "flake.nix" "profile" 1

  if [ "$USE_DEFAULT" -ne 1 ]; then
    echo -e "\nStep 4 - Enabling modules\n"
    echo "You'll now select what modules you want to enable in the home.nix and configuration.nix"
    echo "You may want to read each modules content in order to enable it or not"
    echo "Once you are done, just save the file"
    read -p "Enter anything to continue" proceed
    unset proceed
    default_profile=$(awk -F' = |"' "/profile/ {print \$3}" "flake.nix" | head -n 1)
    vim "$HOME/nix/profiles/$default_profile/home.nix"
    vim "$HOME/nix/profiles/$default_profile/configuration.nix"
  fi

  echo -e "\nStep 5 - Selecting Disk Layout\n"
  setup_disk

  echo -e "\nStep 6 - Applying Disk Layout\n"
  sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount "$HOME/nix/profiles/disks/$disk_layout_option"

  echo -e "\nStep 7 - Updating Hardware Configuration\n"
  sudo nixos-generate-config --no-filesystems --root /mnt
  sudo mv -f "/mnt/etc/nixos/hardware-configuration.nix" "$HOME/nix/profiles/$default/hardware-configuration.nix"

  echo -e "\nStep 8 - Installing NixOS\n"
  if [ ! -d "/nix/.rw-store" ]; then
    sudo mount -o remount,size=10G,noatime /nix/.rw-store
  fi
  sudo nixos-install --flake .#janpstrunn || exit 1

  echo -e "\nStep 9 - Finishing installation\n"
  default_user=$(awk -F' = |"' "/username/ {print \$3}" "flake.nix" | head -n 1)
  nix_home=/mnt/home/$default_user/
  sudo chroot /mnt /nix/var/nix/profiles/system/activate
  echo "Define password for $default_user"
  sudo chroot /mnt/ bash -c "passwd $default_user"

  echo -e "\nStep 10 - Configuring dotfiles\n"

  git clone https://codeberg.org/janpstrunn/dotfiles $HOME/dotfiles
  sudo mv $HOME/dotfiles/ $nix_home
  sudo cp -r $HOME/nix/ $nix_home
  sudo chroot /mnt/ bash -c "cd /home/$default_user/dotfiles && just stow"

  if [ "$USE_DEFAULT" -ne 1 ]; then
    bye
  fi

  read -p "Do you want to reboot now? (Y/n) " reboot_now
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

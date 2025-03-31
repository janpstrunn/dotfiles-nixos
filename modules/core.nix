{ config, pkgs, userSettings, ... }:

{
  imports =
    [
      (./. + "../../profiles/"+("/"+userSettings.profile+"/")+"/hardware-configuration.nix") # User Hardware
      (./. + "./system/wm/"+("/"+userSettings.wm+"/")+".nix") # Window Manager
      # ./system/bluetooth.nix
      ./system/boot-loader.nix
      # ./system/flatpak.nix
      # ./system/gamemode.nix
      ./system/hostname.nix
      # ./system/kernel.nix
      ./system/locale.nix
      # ./system/opengl.nix
      # ./system/podman.nix
      # ./system/power.nix
      # ./system/printer.nix
      # ./system/proxy.nix
      # ./system/steam.nix
      ./system/systemd.nix
      # ./system/time.nix
      # ./system/touchpad.nix
      # ./system/virtualization.nix
      # ./system/automount.nix
      # ./system/blocklist.nix
      # ./system/doas.nix
      # ./system/firejail-profiles
      # ./system/firejail.nix
      # ./system/firewall.nix
      ./system/gpg.nix
      # ./system/openvpn.nix
      # ./system/sshd.nix
      ./system/unfree.nix
    ];

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.admin = {
    isNormalUser = true;
    description = "Admnistrator";
    extraGroups = [ "networkmanager" "wheel" "input" "dialout" "video" "render" ];
    packages = with pkgs; [
      nmap
    ];
  };
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" "input" "dialout" "video" "render" ];
    packages = with pkgs; [
      figlet
    ];
    uid = 1000;
  };

  environment.systemPackages = with pkgs; [
      # All Users
      cryptsetup
      curl
      fzf
      git
      gnutar
      killall
      lazygit
      less
      man
      moreutils
      openssl
      polkit
      pulseaudio
      ripgrep
      udiskie
      unzip
      wget
      zip
      zsh
    ];

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;

  # configuration.nix(5)
  # nixos-help

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}

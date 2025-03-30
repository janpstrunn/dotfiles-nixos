{ config, pkgs, userSettings, ... }:

{
  imports =
    [
      ./lang/languages.nix
      (./. + "../../profiles/"+("/"+userSettings.profile+"/")+"hardware-configuration.nix") # User Hardware
      ./system/wm/hyprland.nix
      # ./system/bluetooth.nix
      ./system/boot-loader.nix
      ./system/hostname.nix
      # ./system/kernel.nix
      ./system/locale.nix
      # ./system/opengl.nix
      # ./system/power.nix
      # ./system/printer.nix
      # ./system/proxy.nix
      ./system/security/gpg.nix
      ./system/security/unfree.nix
      ./system/systemd.nix
      # ./system/time.nix
      # ./system/virtualization.nix
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
    extraGroups = [ "networkmanager" "input" "dialout" "video" "render" ];
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
      lazygit
      less
      man
      moreutils
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

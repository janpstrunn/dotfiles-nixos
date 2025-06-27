{
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    # Required
    (./. + "../../profiles/" + ("/" + userSettings.profile + "/") + "/hardware-configuration.nix") # User Hardware
    (./. + "/system/wm/" + ("/" + userSettings.wm + "/") + ".nix") # Window Manager
    ./system/boot-loader.nix
    ./system/disks.nix
    ./system/flatpak.nix
    ./system/fonts.nix
    ./system/hostname.nix
    # ./system/kernel.nix
    ./system/locale.nix
    ./system/networking.nix
    ./system/nextdns.nix
    # ./system/opengl.nix
    ./system/podman.nix
    ./system/security/automount.nix
    # ./system/security/doas.nix
    ./system/security/firewall.nix
    ./system/security/gpg.nix
    ./system/security/sudo.nix
    # ./system/security/unfree.nix
    ./system/swap.nix
    ./system/systemd.nix
    # ./system/time.nix
  ];

  # Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = ["networkmanager" "wheel" "input" "dialout" "video" "render"];
    shell = pkgs.zsh;
    # packages = with pkgs; [
    #   figlet
    # ];
    uid = 1000;
  };

  environment.systemPackages = with pkgs; [
    # All Users
    age
    bash-completion
    brightnessctl
    cryptsetup
    curl
    direnv
    ffmpeg
    fzf
    gh
    git
    git-crypt
    gitleaks
    gnutar
    gocryptfs
    gvfs
    home-manager
    imagemagick
    jmtpfs
    jq
    just
    killall
    lazygit
    less
    lsof
    man
    moreutils
    mtpfs
    oh-my-posh
    openssl
    polkit
    pulseaudio
    pwgen
    ripgrep
    rmlint
    rsync
    srm
    stow
    tldr
    tree
    udiskie
    unzip
    wget
    ydotool
    zip
    zoxide
  ];

  environment.shells = with pkgs; [bash zsh];
  users.defaultUserShell = pkgs.bash;
  programs.zsh.enable = true;

  # configuration.nix(5)
  # nixos-help

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}

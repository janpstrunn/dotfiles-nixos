{ config, pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
     # Must Have
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
     lm_sensors
  ];
}


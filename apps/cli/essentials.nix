{ config, pkgs, ... }:

{ 
 environment.systemPackages = with pkgs; [
     ueberzugpp
     pulseaudio
     tree
     libnotify
     direnv
     atomicparsley
     ydotool
     age
     jq
     srm
     wget
     git
     curl
     less
     man
     stow
     gnutar
     zip
     zoxide
     zsh
     oh-my-posh
  ];
}

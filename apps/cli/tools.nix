{ config, pkgs, ... }:

{ 
 environment.systemPackages = with pkgs; [
     btop
     zenity
     rsync
     gh
     tldr
     gitleaks
     moreutils
     yt-dlp
     gocryptfs
     cmus
     oath-toolkit
     pwgen
     expect
     navi
     just
     fastfetch
     onefetch
     lazygit
     pass
     cryptsetup
     ranger
     imagemagick
     neovim
     fd
     ripgrep
     ffmpeg
     fzf
     eza
     bat
     tmux
     tmuxp
     zoxide
  ];
}

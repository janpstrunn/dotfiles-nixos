{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    age
    atomicparsley
    bash-completion
    bat
    borgbackup
    brightnessctl
    btop
    cmus
    direnv
    # expect
    eza
    fastfetch
    fd
    ffmpeg
    gh
    gitleaks
    gocryptfs
    gvfs
    imagemagick
    jq
    just
    libargon2
    lsof
    mpv
    mtpfs
    mupdf
    ncdu
    oath-toolkit
    # odt2txt
    oh-my-posh
    onefetch
    pwgen
    ranger
    rsync
    srm
    stow
    tldr
    tmux
    tmuxp
    tree
    ueberzugpp
    ydotool
    yt-dlp
    zoxide
  ];
}

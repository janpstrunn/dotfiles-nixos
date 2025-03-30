{ config, pkgs, userSettings, ... }:

{
  # Desktop Settings
  services.displayManager.ly.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  programs = {
    hyprland.enable = true;
    hyprland.xwayland.enable = true;
    firefox.enable = true;
  };

  users.users.janpstrunn = {
    packages = with pkgs; [
      age
      atomicparsley
      bat
      btop
      cmus
      direnv
      expect
      eza
      fastfetch
      fd
      ffmpeg
      freetube
      gh
      gitleaks
      gocryptfs
      gvfs
      imagemagick
      jq
      just
      kitty
      ly
      mpv
      mtpfs
      navi
      neovim
      oath-toolkit
      oh-my-posh
      onefetch
      pass
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
  };
}

{ config, pkgs, userSettings, ... }:

{
  imports = [
    ../../modules/applications/stylix.nix
  ];
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  programs.home-manager.enable = true;

  home.file = {
    # ".screenrc".source = dotfiles/screenrc;
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #  /etc/profiles/per-user/janpstrunn/etc/profile.d/hm-session-vars.sh
  };

  home.packages = with pkgs; [
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

     age
     atomicparsley
     bat
     brightnessctl
     btop
     brave
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
     passExtensions.pass-otp
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

  home.stateVersion = "24.11";
}

{ config, pkgs, userSettings, ... }:

{
  imports = [
    ../../modules/lang/android.nix
    ../../modules/lang/cpp.nix
    ../../modules/lang/go.nix
    ../../modules/lang/nodejs.nix
    ../../modules/lang/python.nix
    ../../modules/lang/rust.nix
    ../../modules/lang/lsp.nix
    ../../modules/applications/editor.nix
  ];
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.gnome.adwaita-icon-theme;
    name = "Adwaita";
    size = 24; # Adjust the size as needed
  };

  services.udiskie.enable = true;
  services.udiskie.tray = "always";

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

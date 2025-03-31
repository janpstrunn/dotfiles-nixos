{ config, pkgs, userSettings, ... }:

{
  imports = [
    # Programming Languages
    ../../modules/user/lang/android.nix
    ../../modules/user/lang/cpp.nix
    ../../modules/user/lang/go.nix
    ../../modules/user/lang/nodejs.nix
    ../../modules/user/lang/python.nix
    ../../modules/user/lang/rust.nix
    ../../modules/user/lang/lsp.nix
    # Applications
    ../../modules/user/apps/editor.nix
    ../../modules/user/apps/office.nix
    ../../modules/user/apps/browser.nix
  ];

  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = userSettings.iconName;
      package = userSettings.iconTheme;
    };
    theme = {
      name = userSettings.themeName;
      package = userSettings.gtkTheme;
    };
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
    EDITOR = userSettings.editor;
    TERMCMD = userSettings.term;
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #  /etc/profiles/per-user/janpstrunn/etc/profile.d/hm-session-vars.sh
  };

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      music = "${userSettings.homeDir}/media/music";
      videos = "${userSettings.homeDir}/media/videos";
      pictures = "${userSettings.homeDir}/media/pictures";
      templates = "${userSettings.homeDir}/templates";
      download = "${userSettings.homeDir}/downloads";
      documents = "${userSettings.homeDir}/documents";
      desktop = null;
      publicShare = null;
    };
  };

  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;

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

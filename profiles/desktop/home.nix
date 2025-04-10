{ config, pkgs, userSettings, ... }:

{
  imports = [
    # Programming Languages
    ../../modules/user/lang/android.nix
    ../../modules/user/lang/cpp.nix
    ../../modules/user/lang/go.nix
    ../../modules/user/lang/nodejs.nix
    ../../modules/user/lang/python.nix
    ../../modules/user/lang/ruby.nix
    ../../modules/user/lang/rust.nix
    ../../modules/user/lang/lsp.nix
    # Applications
    ../../modules/user/apps/editor.nix
    ../../modules/user/apps/office.nix
    ../../modules/user/apps/browser.nix
    ../../modules/user/apps/media.nix
    ../../modules/user/apps/email.nix
    ../../modules/user/apps/password-manager.nix
    ../../modules/user/apps/drive.nix
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

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "app.zen_browser.zen.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "app.zen_browser.zen.desktop";
      "x-scheme-handler/about" = "app.zen_browser.zen.desktop";
      "x-scheme-handler/unknown" = "app.zen_browser.zen.desktop";
    };
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
     # expect
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
     ncdu
     just
     kitty
     ly
     mpv
     mtpfs
     oath-toolkit
     bash-completion
     oh-my-posh
     onefetch
     # odt2txt
     pwgen
     ranger
     rsync
     srm
     stow
     borgbackup
     tldr
     tmux
     mupdf
     tmuxp
     tree
     ueberzugpp
     ydotool
     yt-dlp
     zoxide
     libargon2
  ];

  home.stateVersion = "24.11";
}

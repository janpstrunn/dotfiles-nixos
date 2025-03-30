{ config, pkgs, ... }:

{
  home.username = "janpstrunn";
  home.homeDirectory = "/home/janpstrunn";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/janpstrunn/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
  home.packages = [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
     pkgs.age
     pkgs.atomicparsley
     pkgs.bat
     pkgs.brightnessctl
     pkgs.btop
     pkgs.brave
     pkgs.cmus
     pkgs.direnv
     pkgs.expect
     pkgs.eza
     pkgs.fastfetch
     pkgs.fd
     pkgs.ffmpeg
     pkgs.freetube
     pkgs.gh
     pkgs.gitleaks
     pkgs.gocryptfs
     pkgs.gvfs
     pkgs.imagemagick
     pkgs.jq
     pkgs.just
     pkgs.kitty
     pkgs.ly
     pkgs.mpv
     pkgs.mtpfs
     pkgs.navi
     pkgs.neovim
     pkgs.oath-toolkit
     pkgs.oh-my-posh
     pkgs.onefetch
     pkgs.pass
     pkgs.pwgen
     pkgs.ranger
     pkgs.rsync
     pkgs.srm
     pkgs.stow
     pkgs.tldr
     pkgs.tmux
     pkgs.tmuxp
     pkgs.tree
     pkgs.ueberzugpp
     pkgs.ydotool
     pkgs.yt-dlp
     pkgs.zoxide
  ];
}

{...}: {
  home.file = {
    # ".screenrc".source = dotfiles/screenrc;
    ".tmuxprofile".text = ''
      $DEV
      $DEV/github/
      $DEV/forgejo/
    '';
    ".gnupg/gpg-agent.conf".text = ''
      # pinentry-program /usr/bin/pinentry-gnome3
      max-cache-ttl 60480000
      default-cache-ttl 60480000
    '';
    # ".local/share/applications/ranger.desktop".text = ''
    #   [Desktop Entry]
    #   Name=Ranger File Manager
    #   Comment=Launch Ranger in Alacritty
    #   Exec=alacritty -e ranger
    #   Icon=utilities-terminal
    #   Terminal=false
    #   Type=Application
    #   Categories=System;FileManager;
    # '';
    ".local/share/applications/yazi.desktop".text = ''
      [Desktop Entry]
      Name=Yazi File Manager
      Comment=Launch Yazi in Alacritty
      Exec=alacritty -e yazi
      Icon=utilities-terminal
      Terminal=false
      Type=Application
      Categories=System;FileManager;
    '';
  };
}

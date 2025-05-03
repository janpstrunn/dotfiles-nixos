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
  };
}

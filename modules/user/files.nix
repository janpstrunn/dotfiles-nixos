{...}: {
  home.file = {
    # ".screenrc".source = dotfiles/screenrc;
    ".tmuxprofile".text = ''
      $DEV
      $DEV/github/
      $DEV/forgejo/
    '';
  };
}

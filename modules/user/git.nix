{
  pkgs,
  userSettings,
  ...
}: {
  home.packages = [pkgs.git];
  programs.git = {
    enable = true;
    userName = userSettings.name;
    userEmail = userSettings.email;
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = [
        ("/home/" + userSettings.username + "/dotfiles")
        ("/home/" + userSettings.username + "/nix")
      ];
    };
  };
}

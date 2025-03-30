{ config, pkgs, userSettings, ... }:

{
  home.username = admin;
  home.homeDirectory = "/home/admin";

  home.stateVersion = "24.11";

  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;
  home.packages = with pkgs; [
     # bat
     # eza
     # fd
     # gocryptfs
     # just
     # neovim
     # oh-my-posh
     # ranger
     # rsync
     # srm
     # tmux
     # tree
     # zoxide
  ];
}

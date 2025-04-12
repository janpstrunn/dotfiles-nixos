{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    libreoffice
    evince
    gnome-font-viewer
    seahorse
    gnome-maps
    pandoc
    taskwarrior3
    newsboat
    zotero
    ddgr
  ];
}

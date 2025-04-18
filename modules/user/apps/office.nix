{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    evince
    # gnome-font-viewer
    gnome-maps
    libreoffice
    newsboat
    pandoc
    seahorse
    # taskwarrior3
    zotero
  ];
}

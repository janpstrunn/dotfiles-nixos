{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    libreoffice
    evince
    gnome-disk-utility
    gnome-font-viewer
    seahorse
    gnome-maps
    pandoc
    taskwarrior3
    newsboat
  ];
}

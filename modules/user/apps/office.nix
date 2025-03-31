{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    libreoffice
    foliate
    gnome-disk-utility
    gnome-font-viewer
    seahorse
    gnome-maps
  ];
}

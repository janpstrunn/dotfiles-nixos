{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    libreoffice-stable
    foliate
    gnome-disk-utility
    gnome-seahorse
    gnome-font-viewer
    gnome-gnome-maps
  ];
}

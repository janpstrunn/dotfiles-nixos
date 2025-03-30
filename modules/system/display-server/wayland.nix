{ config, pkgs, ... }:

{
  imports = [
    ../audio.nix
    ../dbus.nix
    ../fonts.nix
    ../gnome-keyring.nix
    ./xserver.nix
  ];
}

{ config, pkgs, userSettings, ... }:

{
  # Desktop Settings
  services.displayManager.ly.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  programs = {
    hyprland.enable = true;
    hyprland.xwayland.enable = true;
    firefox.enable = true;
  };
}

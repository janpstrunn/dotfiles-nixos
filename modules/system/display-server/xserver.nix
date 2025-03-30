{ config, pkgs, systemSettings, ... }:

{
  services.xserver = {
    enable = true;
    xkb = {
      layout = systemSettings.keyboard;
      variant = "";
      options = "caps:escape";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-utils
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  services.udiskie.enable = true;
  services.udiskie.tray = "always";

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    adwaita-qt
    libnotify
    xclip
    xdotool
    zenity
  ];
}



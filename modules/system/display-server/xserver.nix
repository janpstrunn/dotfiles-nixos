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
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    adwaita-qt
    libnotify
    xclip
    xdotool
    zenity
  ];
}



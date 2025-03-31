{ config, pkgs, userSettings, systemSettings, ... }:

{
  services.xserver = {
    enable = true;
    xkb = {
      layout = systemSettings.keyboard;
      variant = "";
      options = "caps:escape";
    };
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-utils
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
      ];
    };
    userDirs = {
      enable = true;
      createDirectories = true;
      music = "${homeDir}/media/music";
      videos = "${homeDir}/media/videos";
      pictures = "${homeDir}/media/pictures";
      templates = "${homeDir}/templates";
      download = "${homeDir}/downloads";
      documents = "${homeDir}/documents";
      desktop = null;
      publicShare = null;
    };
  };

  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;

  environment.sessionVariables.XCURSOR_THEME = "Adwaita";
  environment.sessionVariables.XCURSOR_SIZE = "20";

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    adwaita-qt
    libnotify
    xclip
    xdotool
    zenity
  ];
}



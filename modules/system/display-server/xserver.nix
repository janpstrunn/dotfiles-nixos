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

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    adwaita-qt
    libnotify
    xclip
    xdotool
    zenity
  ];
}



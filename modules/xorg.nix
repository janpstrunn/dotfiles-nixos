{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  environment.systemPackages = with pkgs; [
    libnotify
    xclip
    xdotool
    zenity
  ];
}



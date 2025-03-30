{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  environment.systemPackages = with pkgs; [
    xclip
    libnotify
    zenity
  ];
}



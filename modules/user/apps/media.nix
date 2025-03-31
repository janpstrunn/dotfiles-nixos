{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gimp
    mpv
    # obs-studio
  ];
}

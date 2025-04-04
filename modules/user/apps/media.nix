{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gimp
    mpv
    mermaid-cli
    # obs-studio
  ];
}

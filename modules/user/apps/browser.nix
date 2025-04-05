{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    librewolf-bin
  ];
}

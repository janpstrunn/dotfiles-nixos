{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    lynx
    # brave
  ];
}

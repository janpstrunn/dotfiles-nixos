{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    # alacritty
    # ghostty
    # foot
  ];
}


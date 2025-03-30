{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    emacs
    neovim
  ];
}

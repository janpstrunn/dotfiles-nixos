{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    lynx
    buku
    # brave
  ];
}

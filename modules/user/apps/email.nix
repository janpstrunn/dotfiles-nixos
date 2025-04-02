{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neomutt
    mutt-wizard
  ];
}

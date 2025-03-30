{ config, pkgs, ... }:

{ 
 environment.systemPackages = with pkgs; [
     freetube
     mpv
  ];
}

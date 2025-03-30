{ config, pkgs, ... }:

{ 
 environment.systemPackages = with pkgs; [
     gvfs
     mtpfs
     polkit
     udiskie
  ];
}

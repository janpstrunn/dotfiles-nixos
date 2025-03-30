
{ config, pkgs, ... }:

{ 
 environment.systemPackages = with pkgs; [
     clang
     cargo
     cmake
     nodejs
     python3Full
     rustup
     rustc
     go
  ];
}

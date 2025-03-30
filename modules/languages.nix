{ config, pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
     cargo
     clang
     cmake
     go
     nodejs
     python3Full
     rustc
     rustup
  ];
}

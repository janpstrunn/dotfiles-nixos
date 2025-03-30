{ pkgs, ... }:

{
  imports = [
    ./python/packages.nix
  ];

  home.packages = with pkgs; [
      python3Full
      imath
      pystring
  ];
}

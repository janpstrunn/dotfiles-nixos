{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    steam
  ];
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-unwrapped"
  ];
  hardware.opengl.driSupport32Bit = true;
  programs.steam.enable = true;
}

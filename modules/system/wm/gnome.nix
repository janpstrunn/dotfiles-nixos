{ config, pkgs, userSettings, ... }:

{
  imports = [
    ../display-server/wayland.nix
  ];

  services.xserver = {
    # displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  services.xserver.excludePackages = [ pkgs.xterm ];
  services.displayManager.${userSettings.displayManager}.enable = true;
}

{ config, pkgs, userSettings, ... }:

{
  imports = [
    ../display-server/wayland.nix
  ];

  services.xserver = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

  services.xserver.excludePackages = [ pkgs.xterm ];
  services.displayManager.${userSettings.displayManager}.enable = true;
}

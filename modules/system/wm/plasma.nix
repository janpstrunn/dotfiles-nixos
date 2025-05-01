{pkgs, ...}: {
  imports = [
    ../display-server/wayland.nix
    ../display-server/display-manager.nix
  ];

  services.xserver = {
    desktopManager.plasma6.enable = true;
  };

  services.xserver.excludePackages = [pkgs.xterm];
}

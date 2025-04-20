{
  config,
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    ../display-server/wayland.nix
    ../display-server/display-manager.nix
  ];

  services.xserver = {
    desktopManager.gnome.enable = true;
  };

  services.xserver.excludePackages = [pkgs.xterm];
}

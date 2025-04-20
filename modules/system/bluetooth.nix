{pkgs, ...}: {
  services = {
    blueman-applet.enable = true;
    blueman.enable = true;
  };

  hardware.bluetooth.enable = true;
}

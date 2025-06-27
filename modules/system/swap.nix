{...}: {
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      randomEncryption.enable = true;
      size = 16 * 1024;
    }
  ];
}

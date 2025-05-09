{...}: {
  # Firewall
  networking.firewall.enable = true;
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [8080];
  networking.firewall.allowedUDPPorts = [8080];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}

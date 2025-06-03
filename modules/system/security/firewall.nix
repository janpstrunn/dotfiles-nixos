{...}: {
  # Firewall
  networking.firewall = {
    # Open ports in the firewall.
    enable = true;
    allowedTCPPorts = [8080];
    allowedUDPPorts = [8080];
    # interfaces."wlan0".allowedTCPPorts = [8080];
  };
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}

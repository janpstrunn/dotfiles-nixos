{...}: {
  services.taskchampion-sync-server = {
    enable = true;
    host = "192.168.0.35";
    port = 8080;
    openFirewall = true;
  };
}

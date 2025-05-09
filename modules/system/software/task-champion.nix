{...}: {
  services.taskchampion-sync-server = {
    enable = true;
    port = 8080;
    openFirewall = true;
  };
}

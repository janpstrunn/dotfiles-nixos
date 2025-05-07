{...}: {
  services.taskchampion-sync-server = {
    enable = true;
    allowClientIds = "6b00cabe-4e17-405f-878b-5b61a99cf326";
    port = 8080;
  };
}

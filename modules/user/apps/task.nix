{pkgs, ...}: {
  home.packages = with pkgs; [
    taskchampion-sync-server
  ];
}

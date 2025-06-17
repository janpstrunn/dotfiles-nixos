{pkgs, ...}: {
  home.packages = with pkgs; [
    taskwarrior3
    taskwarrior-tui
    taskchampion-sync-server
  ];
}

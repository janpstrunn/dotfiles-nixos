{pkgs, ...}: {
  home.packages = with pkgs; [
    taskchampion-sync-server
    taskwarrior3
    taskwarrior-tui
    timewarrior
  ];
}

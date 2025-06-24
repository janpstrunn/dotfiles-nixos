{pkgs, ...}: {
  home.packages = with pkgs; [
    # freetube
    gimp3
    # mermaid-cli
    mpv
    # obs-studio
    # vlc
  ];
}

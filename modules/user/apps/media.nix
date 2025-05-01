{pkgs, ...}: {
  home.packages = with pkgs; [
    # freetube
    gimp
    # mermaid-cli
    mpv
    # obs-studio
  ];
}

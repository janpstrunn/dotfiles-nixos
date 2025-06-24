{pkgs, ...}: {
  home.packages = with pkgs; [
    # brave
    buku
    # ddgr
    # firefox
    # floorp
    # librewolf
    lynx
    # nyxt
    # qutebrowser
    # ungoogled-chromium
    # vivaldi
    # w3m
  ];
}

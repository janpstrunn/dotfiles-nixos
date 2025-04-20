{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # brave
    buku
    ddgr
    lynx
  ];
}

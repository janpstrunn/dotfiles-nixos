{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    megacmd
    rclone
  ];
}

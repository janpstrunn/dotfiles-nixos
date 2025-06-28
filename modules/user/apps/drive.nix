{pkgs, ...}: {
  home.packages = with pkgs; [
    # borgbackup
    # megacmd
    rclone
    restic
  ];
}

{userSettings, ...}: {
  fileSystems."/mnt/rclone" = {
    device = "Filen:";
    fsType = "rclone";
    options = [
      "nodev"
      "nofail"
      "allow_other"
      "args2env"
      "config=/home/${userSettings.username}/.config/rclone/rclone.conf"
    ];
  };
}

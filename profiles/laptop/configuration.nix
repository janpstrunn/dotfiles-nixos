{userSettings, ...}: {
  imports = [
    ../../modules/core.nix
    # ../../modules/system/bluetooth.nix
    # ../../modules/system/docker.nix
    # ../../modules/system/gamemode.nix
    ../../modules/system/power.nix
    # ../../modules/system/printer.nix
    # ../../modules/system/proxy.nix
    # ../../modules/system/rclone.nix
    # ../../modules/system/security/blocklist.nix
    # ../../modules/system/security/firejail.nix
    # ../../modules/system/security/openvpn.nix
    # ../../modules/system/security/openvpn.nix
    # ../../modules/system/spell.nix
    # ../../modules/system/steam.nix
    ../../modules/system/touchpad.nix
    # ../../modules/system/virtualization.nix
    (import ../../modules/system/security/sshd.nix {
      authorizedKeys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAX7m33igDwueGdRAvoxEOTVfB5PJQYEOINBkKc76gXE janpstrunn@beelzebub"];
      inherit userSettings;
    })
  ];
}

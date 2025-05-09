{
  pkgs,
  userSettings,
  ...
}: {
  security.sudo = {
    enable = true;
    extraRules = [
      {
        users = [userSettings.username];
        commands = [
          {
            command = "${pkgs.systemd}/bin/systemctl suspend";
            options = ["NOPASSWD"];
          }
          {
            command = "${pkgs.systemd}/bin/reboot";
            options = ["NOPASSWD"];
          }
          {
            command = "${pkgs.systemd}/bin/poweroff";
            options = ["NOPASSWD"];
          }
          {
            command = "${pkgs.tomb} slam";
            options = ["NOPASSWD"];
          }
        ];
      }
    ];
    extraConfig = with pkgs; ''
      Defaults:picloud secure_path="${lib.makeBinPath [
        systemd
      ]}:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin"
    '';
  };
}

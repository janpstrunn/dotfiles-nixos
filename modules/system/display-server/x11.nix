{pkgs, ...}: {
  imports = [
    ../audio.nix
    ../dbus.nix
    ../fonts.nix
    ../gnome-keyring.nix
    ./xserver.nix
  ];

  services.xserver = {
    excludePackages = [pkgs.xterm];
    libinput = {
      touchpad.disableWhileTyping = true;
    };
  };
}

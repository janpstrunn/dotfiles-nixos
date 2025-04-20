{
  config,
  pkgs,
  userSettings,
  systemSettings,
  ...
}: {
  services.xserver = {
    enable = true;
    xkb = {
      layout = systemSettings.keyboard;
      variant = "";
      options = "caps:escape";
    };
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-utils
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };

  environment.sessionVariables.XCURSOR_THEME = "Adwaita";
  environment.sessionVariables.XCURSOR_SIZE = "20";

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    adwaita-qt
    libnotify
    xclip
    xdotool
    zenity
    dconf
  ];
}

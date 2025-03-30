{ config, pkgs, userSettings, ... }:

{
  imports = [
    ../display-server/wayland.nix
  ];

  programs = {
    hyprland = {
      enable = true;
      # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland = {
        enable = true;
      };
      # portalPackage = pkgs-hyprland.xdg-desktop-portal-hyprland;
    };
    firefox.enable = true;
    zsh.enable = true;
  };

  services.xserver.excludePackages = [ pkgs.xterm ];
  # services.xserver.displayManager.ly = true;
  services.displayManager.ly.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
      # Hyprland Essentials
      cliphist
      cpio
      dunst
      hyprland
      hyprlang
      meson
      playerctl
      waybar
      lm_sensors
      wl-clipboard
      ly
      wl-clipboard-x11
      wlsunset
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      # Extra Hyprland
      hypridle
      hyprlock
      hyprpaper
      hyprpicker
      hyprpolkitagent
      hyprsunset
      # Extra Tools
      fuzzel
      grim
      rofi-wayland
      slurp
      swayimg
      swww
      wf-recorder
      wttrbar
  ];
}

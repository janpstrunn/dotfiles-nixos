{ config, pkgs, ... }:

{
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
      wl-clipboard
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

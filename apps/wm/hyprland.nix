{ config, pkgs, ... }:

{ 
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; 
  environment.systemPackages = with pkgs; [
      # Hyprland Essentials
      hyprland
      hyprlang
      meson
      wlsunset 
      wl-clipboard 
      waybar
      dunst
      cpio
      cliphist
      playerctl
      xdg-desktop-portal 
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      # Extra Hyprland
      hyprpaper
      hypridle
      hyprlock
      hyprpicker
      hyprpolkitagent
      hyprsunset
      # Extra Tools
      swww
      rofi-wayland 
      wttrbar
      swayimg
      grim
      slurp
      wf-recorder
  ];
}

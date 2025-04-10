{ config, pkgs, userSettings, ... }:

{
  imports = [
    ../display-server/wayland.nix
    ../display-server/display-manager.nix
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
  };

  services.xserver.excludePackages = [ pkgs.xterm ];

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
      xdg-desktop-portal-hyprland
      pavucontrol
      libva-utils
      gsettings-desktop-schemas
      wlr-randr
      pinentry-gnome3
      # Extra Hyprland
      hypridle
      hyprlock
      hyprpaper
      hyprpicker
      hyprpolkitagent
      hyprsunset
      hyprland-protocols
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

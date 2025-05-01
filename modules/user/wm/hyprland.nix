{pkgs, ...}: {
  # Hyprland Packages if used in non-NixOS system
  home.packages = with pkgs; [
    # Essentials
    cliphist
    cpio
    dunst
    gsettings-desktop-schemas
    hyprland
    hyprlang
    libva-utils
    lm_sensors
    meson
    pavucontrol
    pinentry-gnome3
    playerctl
    waybar
    wl-clipboard
    wl-clipboard-x11
    wlr-randr
    xdg-desktop-portal-hyprland
    # Extra Hyprland
    hypridle
    hyprland-protocols
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

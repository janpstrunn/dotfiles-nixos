{
  config,
  pkgs,
  userSettings,
  ...
}: {
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

  services.xserver.excludePackages = [pkgs.xterm];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    # Hyprland Essentials
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

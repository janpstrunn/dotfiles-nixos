{
  config,
  pkgs,
  # pkgs-unstable,
  ...
}: {
  home.packages = with pkgs; [
    # kitty
    alacritty
  ];
  # ++ (with pkgs-unstable; [
  #   foot
  # ]);
}

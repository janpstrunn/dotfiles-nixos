{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-emoji
    fira-code
  ];

  fonts.fontDir.enable = true;
}

{ pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
     nerdfonts
     noto-fonts
     noto-fonts-emoji
  ];

  fonts.fontDir.enable = true;
}

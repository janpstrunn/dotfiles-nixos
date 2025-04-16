{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    emacs
    emacs-lsp-booster
    neovim
    poppler_utils
    ffmpegthumbnailer
    mediainfo
    vips
  ];
}

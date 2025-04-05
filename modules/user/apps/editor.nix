{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    emacs
    emacs-lsp-booster
    hunspell
    hunspellDicts.en_US
    hunspellDicts.pt_BR
    neovim
    poppler_utils
    ffmpegthumbnailer
    mediainfo
    vips
  ];

   services.emacs.enable = true;
}

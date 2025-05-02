{pkgs, ...}: let
  emacsPrograms = with pkgs; [
    emacs
    emacs-lsp-booster
    ffmpegthumbnailer
    graphviz
    mediainfo
    poppler_utils
    vips
  ];

  neovimPackages = with pkgs; [
    neovim
    neovide
  ];

  otherPackages = with pkgs; [
    # joplin
  ];
in {
  home.packages = emacsPrograms ++ neovimPackages ++ otherPackages;
}

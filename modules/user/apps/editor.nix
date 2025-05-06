{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "obsidian"
    ];
  home.packages = with pkgs; [
    neovim
    neovide
    obsidian
  ];
}

{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    obsidian
  ];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "obsidian"
    ];
}

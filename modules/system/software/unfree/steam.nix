{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    steam
  ];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
    ];
  hardware.graphics.enable32Bit = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
}

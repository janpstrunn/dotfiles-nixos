{ pkgs, ... }:

{
  services.pcscd.enable = true;
  programs = {
    mtr.enable = true;
    gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableSSHSupport = true;
    };
  };
}

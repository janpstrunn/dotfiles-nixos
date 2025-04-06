{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tomb
    (pkgs.pass.withExtensions (exts: [
      pkgs.passExtensions.pass-otp
      pkgs.passExtensions.pass-tomb
    ]))
    zbar
  ];
}

{pkgs, ...}: {
  home.packages = with pkgs; [
    isync
    mutt-wizard
    neomutt
  ];
}

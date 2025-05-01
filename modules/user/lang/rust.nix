{pkgs, ...}: {
  home.packages = with pkgs; [
    rustc
    rustup
  ];
}

{pkgs, ...}: {
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    fira-code
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "Ubuntu"
        "FiraCode"
      ];
    })
  ];

  fonts.fontDir.enable = true;
}

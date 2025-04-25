{pkgs, ...}: {
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    fira-code
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "Ubuntu"
        "DejaVu Sans"
        "FiraCode"
      ];
    })
  ];

  fonts.fontDir.enable = true;
}

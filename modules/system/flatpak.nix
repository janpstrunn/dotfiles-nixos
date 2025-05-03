{...}: {
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    packages = [
      "io.freetubeapp.FreeTube"
      "app.zen_browser.zen"
    ];
  };
}

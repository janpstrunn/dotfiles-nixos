{ config, userSettings, ... }:

{
  imports =
    [
      (./. + "../profiles/"+("/"+userSettings.profile+"/"+userSettings.username)+".nix") # User Config
      # (./. + "../../../system/wm"+("/"+userSettings.wm)+".nix") # My window manager
      ../profiles/admin.nix # Admnistrator
    ];
}

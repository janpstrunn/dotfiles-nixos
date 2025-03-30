{ config, userSettings, ... }:

{
  imports =
    [
      (./. + "../../profiles/"+("/"+userSettings.profile+"/"+userSettings.username)+".nix") # User Config
    ];
}

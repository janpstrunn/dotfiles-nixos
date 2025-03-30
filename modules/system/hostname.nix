{ config, ... }:

{
  networking.hostName = systemSettings.hostname;
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # wpa_supplicant
}

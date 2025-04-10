{ config, userSettings, ... }:

{
  services.displayManager.${userSettings.displayManager}.enable = true;
}

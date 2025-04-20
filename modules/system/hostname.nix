{
  config,
  systemSettings,
  ...
}: {
  networking.hostName = systemSettings.hostname;
}

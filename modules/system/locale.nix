{ config, systemSettings, ... }:

{
  time.timeZone = systemSettings.timezone;
  i18n.defaultLocale = systemSettings.locale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemSettings.extra_locale;
    LC_IDENTIFICATION = systemSettings.extra_locale;
    LC_MEASUREMENT = systemSettings.extra_locale;
    LC_MONETARY = systemSettings.extra_locale;
    LC_NAME = systemSettings.extra_locale;
    LC_NUMERIC = systemSettings.extra_locale;
    LC_PAPER = systemSettings.extra_locale;
    LC_TELEPHONE = systemSettings.extra_locale;
    LC_TIME = systemSettings.locale;
  };
}


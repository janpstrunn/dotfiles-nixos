{ config, pkgs, ... }:

let
  nextdnsConfig = import ./nextdns-profile.nix;
  nextdns_profile = nextdnsConfig.nextdns_profile;
in
{
  environment.systemPackages = with pkgs; [
      nextdns
    ];
  services.nextdns = {
    enable = true;
    arguments = [ "-config" nextdns_profile "-cache-size" "10MB" ];
  };
  systemd.services.nextdns-activate = {
    script = ''
      /run/current-system/sw/bin/nextdns activate
    '';
    after = [ "nextdns.service" ];
    wantedBy = [ "multi-user.target" ];
  };
}

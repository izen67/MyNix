{ config, pkgs, ... }:

{
 hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
        General = {
            Experimental = true; # Show battery charge of Bluetooth devices
            Enable = "Source,Sink,Media,Socket"; # A2DP Sink
            };
        };
    };

 systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    };
}

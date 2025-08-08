{ config, pkgs, ... }:

{

  #to allow ntfs drive to get mounted, otherwise error:
  boot.supportedFilesystems = [ "ntfs" ];

  #mount ssd
  fileSystems."/mnt/extras" = {
    device = "/dev/disk/by-uuid/60fc72ce-8793-4f92-8641-0db9411d931e";
    fsType = "ext4";
    options = [ "nofail" "x-systemd.device-timeout=5s" ];
  };

  environment.systemPackages = with pkgs; [
    ntfs3g
    exfatprogs
    cifs-utils
  ];

}

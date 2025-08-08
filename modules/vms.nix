{ config, pkgs, ... }:

{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["izen"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  environment.systemPackages = with pkgs; [
    qemu
  ];
}

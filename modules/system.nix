{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  # For auto printer discovery:
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}

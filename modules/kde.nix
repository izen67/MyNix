{ config, pkgs, ... }:

{

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";

  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    kdePackages.sddm-kcm
    libunity
    kdePackages.kate
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
    kdePackages.plasma-firewall
    plasma-panel-colorizer
    kdePackages.dolphin-plugins
    kdePackages.kcalc
  ];
}

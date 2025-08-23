{ config, pkgs, ... }:

let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "purple_leaves";
  };

in {
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
    };
    autoNumlock = true;
    #enableHidpi = true;
    theme = "sddm-astronaut-theme";
    settings = {
      Theme = {
        Current = "sddm-astronaut-theme";
        CursorTheme = "Bibata-Modern-Ice";
        CursorSize = 24;
      };
    };
    extraPackages = with pkgs; [
      custom-sddm-astronaut
    ];
  };

  environment.systemPackages = with pkgs; [
    custom-sddm-astronaut
    kdePackages.qtmultimedia
    kdePackages.qtsvg
  ];
}

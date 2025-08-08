{ config, pkgs, ... }:

{
  services.flatpak.enable = true;
  programs.gamemode.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };
    environment.systemPackages = with pkgs; [
    mangohud
    goverlay
    protonup
    lutris
    wineWowPackages.stable
    winetricks
  ];
}

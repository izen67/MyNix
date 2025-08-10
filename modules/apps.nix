{ config, pkgs, ... }:

{
  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    wget
    git
    mpv
    vesktop
    spotify
    jellyfin-media-player
    libreoffice-fresh
    haruna
    qbittorrent
    chromium
    brave
    anydesk
    rustdesk
    godot
    vscode-fhs
    nmap
    lmstudio
  ];
}

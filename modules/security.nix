{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ufw
  ];
}

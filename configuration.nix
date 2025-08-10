# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs,  ... }:

{
  imports =
    [ # Include the results of the hardware scan.
     ./hardware-configuration.nix
     inputs.home-manager.nixosModules.default
     ./modules/apps.nix
     ./modules/kde.nix
     ./modules/gaming.nix
     ./modules/locale.nix
     ./modules/mounts.nix
     ./modules/network.nix
     ./modules/nvidia.nix
     ./modules/sound.nix
     ./modules/system.nix
     ./modules/users.nix
     ./modules/vms.nix
     ./modules/spicetify.nix
    ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      "izen" = import ./home.nix;
    };
  };

}

{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.izen = {
    isNormalUser = true;
    description = "izen";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}

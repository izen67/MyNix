If flakes are present, to update you need to do
```
cd /etc/nixos
sudo nix flake update
sudo nixos-rebuild switch
```

That's the only way the packages will update to the latest version in unstable. sudo nix-channel --update and commands like that do not work when using flakes.

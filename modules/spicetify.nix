{ pkgs, inputs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [
    inputs.spicetify-nix.nixosModules.spicetify
  ];

  programs.spicetify = {
    enable = true;
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
    ];
    enabledExtensions = with spicePkgs.extensions; [
      #beautifulLyrics
      fullAppDisplay
      shuffle
      betterGenres
      simpleBeautifulLyrics
    ];
    theme = spicePkgs.themes.lucid;
    #colorScheme = "spotify";
  };
}

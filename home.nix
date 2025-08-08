{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "izen";
  home.homeDirectory = "/home/izen";

  home.file.".config/autostart/mpv-stream.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=MPV RTSP Stream
    Exec=sh -c 'sleep 5 && /run/current-system/sw/bin/mpv --no-input-default-bindings --geometry=800x600+0+243 --autofit=800x600 --no-border --video-unscaled=yes --no-keepaspect --panscan=1.0 --mute=yes rtsp://192.168.50.227:554/11'
    Terminal=false
    StartupNotify=false
    Categories=AudioVideo
    Comment=Autostarts MPV with RTSP camera feed
  '';

  home.file.".config/kwinrulesrc".text = ''
    [General]
    count=2
    rules=edcc5997-6b3b-48c7-a8c0-c9624bcff95c,e3935d11-0309-4a7b-925f-3983d6e9abf3

    [e3935d11-0309-4a7b-925f-3983d6e9abf3]
    Description=vesktop
    ignoregeometry=true
    ignoregeometryrule=3
    position=734,150
    positionrule=3
    size=1186,749
    sizerule=3
    wmclass=vesktop
    wmclassmatch=1

    [edcc5997-6b3b-48c7-a8c0-c9624bcff95c]
    Description=mpv
    ignoregeometry=true
    ignoregeometryrule=3
    position=0,107
    positionrule=3
    size=734,601
    sizerule=4
    skiptaskbar=true
    skiptaskbarrule=3
    wmclass=mpv
    wmclassmatch=1
  '';


  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/izen/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

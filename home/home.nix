{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  userSettings,
  ...
}:
{
  imports = [
    ./packages.nix

    ./modules/sh.nix
    ./modules/cli/default.nix
    ./modules/gui
    # ./modules/development/text_editors/vscode.nix
    ./modules/gui/web_browsers.nix
    ./modules/gui/terminals.nix
    ./modules/gui/games.nix
    ./modules/ai/ai_editors.nix
    ./modules/ai/ai_cli.nix
    ./modules/games/emulators.nix
    ./modules/games/default.nix
    ./modules/audio/daws.nix
    ./modules/video/video_players.nix
    ./modules/video/video_editors.nix
    ./modules/images/image_editors.nix
    ./modules/development/game_development/default.nix
    ./modules/development/web_development/default.nix
    ./modules/gui/office.nix
  ]; # imports

  config = {
    home.activation.removeOldConfigs = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
      if test -f /home/${userSettings.username}/.gtkrc-2.0.backup; then
        rm /home/${userSettings.username}/.gtkrc-2.0.backup
      fi
    '';

    news.display = "silent";

    home.username = "${userSettings.username}";
    home.homeDirectory = "/home/${userSettings.username}";

    # targets.genericLinux.enable = true; # enable this on non-nixos

    # You should not change this value, even if you update Home Manager.
    # If you do want to update the value,
    # then make sure to first check the Home Manager release notes.
    home.stateVersion = "24.11"; # DO NOT CHSNGE

    nixpkgs = {
      overlays = [
        inputs.nur.overlays.default
      ]; # overlays
      config = {
        allowUnfree = true;
      }; # config
    }; # nixpkgs

    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "obsidian"
        "steam"
        "steam-unwrapped"
        "google-chrome"
        "anydesk"
        "libsciter"
        "discord"
        "dropbox"
        "reaper"
        "languagetool"
      ]; # nixpkgs.config.allowUnfreePredicate

    nixpkgs.config.permittedInsecurePackages = [
      "electron-27.3.11"
      "electron-32.3.3"
      "mbedtls-2.28.10" # What depend on this?
      #"qtwebkit-5.212.0-alpha4"
      "xpdf-4.06"
      "qtwebengine-5.15.19"
      "docker-28.5.2"
    ]; # nixpkgs.config.permittedInsecurePackages

    fonts.fontconfig.enable = true;

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

      # "Copy and Paste" config files.
      #
      # 1st method
      #
      #  home.file.".config/hypr/hyperland.conf".text = ''
      #<contents of the config>
      #'';
      #
      #
      # 2nd method
      #
      #  home.file.".config/hypr/hyperland.conf".source = ./hyperland.conf;
      #".bashrc".source = lib.mkDefault ./home/config/bash/.bashrc;
      ".profile".source = lib.mkDefault ./config/bash/.profile;
    };

    # Home Manager can also manage your environment variables through 'home.sessionVariables'.
    # These will be explicitly sourced when using a shell provided by Home Manager.
    # If you don't want to manage your shell through Home Manager
    # then you have to manually source 'hm-session-vars.sh' located at either
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    # or
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    # or
    #  /etc/profiles/per-user/jolitp/etc/profile.d/hm-session-vars.sh
    home.sessionVariables = {
      EDITOR = "nvim";
      # TESTING = lib.mkDefault "home.nix";
      FLAKE = "/home/jolitp/dotfiles";
      XCURSOR_SIZE = "32";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
    # error: The option `programs.home-manager.backupFileExtension' does not exist. Definition values:
    # error persists after changing it's place
    # use `... -b backup` command flag
    # programs.home-manager.backupFileExtension = "backup";
  }; # config
}

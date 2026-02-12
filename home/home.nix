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
    ./modules/sh.nix
    ./modules/cli/default.nix
    ./modules/gui
    ./modules/gui/web_browsers.nix
    ./modules/gui/terminals.nix
    ./modules/gui/games.nix
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
    home.stateVersion = "24.11";

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
    ]; # nixpkgs.config.permittedInsecurePackages

    fonts.fontconfig.enable = true;

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages =
      # Stable Packages
      (with pkgs; [

        # error: nerdfonts has been separated into individual font packages under the namespace nerd-fonts.
        fira-code
        fira-code-symbols
        nerd-fonts.fira-code
        nerd-fonts.jetbrains-mono
        # nerd-fonts.fira-code-symbols

        # Cintiq 16 tools
        brightnessctl
        # xrandr # for X11 only

        # (nerdfonts.override {
        #   fonts = [
        #     "FiraCode"
        #     "JetBrainsMono"
        #     "CascadiaCode"
        #     "CodeNewRoman"
        #   ];
        # })

        # DID NOT WORK AS A FIX
        # nerdfonts.fira-code fira-code-symbols
        # nerdfonts.fira-code-symbols

        # # It is sometimes useful to fine-tune packages, for example, by applying
        # # overrides. You can do that directly here, just don't forget the
        # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
        # # fonts?
        # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

        # vimPlugins.nvim-treesitter.withPlugins

        chezmoi # dotfiles manager # no config
        alejandra # nix formatter
        nixd # nix language server
        nixfmt
        #nvf # neovim configuration and plugin manager - installed in a different way

        atuin

        bc # calculator # does not have configuration, enable option errors out
        doublecmd # double commander - midnight-commander alternative # does not have a configuration
        cheat # command line cheat sheets # does not have a configuration
        dust # does not have configuration, enable option errors out
        entr # folder watcher # calculator # does not have configuration, enable option errors out
        # ffmpeg # does not have configuration, enable option errors out
        ffmpeg-full
        just # does not have configuration, enable option errors out
        lm_sensors # does not have configuration, enable option errors out
        ripgrep-all # does not have configuration, enable option errors out
        speedtest # does not have configuration, enable option errors out
        s-tui # TUI CPU stress and monitoring utility # does not heave a configureation
        tldr # does not have configuration, enable option errors out
        visidata # does not have configuration, enable option errors out
        xclip # does not have configuration, enable option errors out
        powertop # errors when configured
        unrar

        # cal # not found
        xpdf # pdfimages cli program and more # removed as insecure # find alternative
        # grub-reboot # not found
        # mojo # website scrapper # not found
        # qcalc # not found

        # supporting applications for GUIs
        flatpak
        gearlever
        devbox
        #bottles
        # warehouse # not found - install through flatpak
        # flatseal # not found - install through flatpak
        protontricks
        winetricks
        devbox

        # GUIs
        resources
        # espanso
        obsidian
        bazecor
        redshift
        anytype

        # Games
        lutris # does not have a configuration
        antimicrox # does not have a configuration
        # lime3ds # not found? no error? deprecated
        # ryujinx # error: 'ryujinx' has been replaced by 'ryubing' as the new upstream
        ryubing
        heroic
        mgba
        duckstation
        sameboy
        stella
        kega-fusion
        snes9x
        mame
        mesen
        melonDS
        desmume
        yabause
        gopher64
        mupen64plus
        flycast
        pcsx2
        dolphin-emu
        cemu
        xemu
        # gens-gs

        # TODO get them from other means
        # citra # not found - install through flatpak?
        azahar # 3DS Emulator
        #azahar # does not install - name is right
        #azahar # does not have a configuration

        # Internet
        thunderbird

        # Images
        inkscape
        blender
        krita
        flameshot
        converseen
        gimp

        # Videos
        # error: The top-level kdenlive alias has been removed.
        kdePackages.kdenlive
        # avidemux # nixos version is bugged on wayland
        # the flatpak version also is bugged
        obs-studio

        # programming
        zed
        nodejs
        # npm
        pnpm
        svelte-language-server
        prisma-engines
        prisma

        # Game Dev
        godot # better leave it for specific shell
        gdevelop # does not install - name is right
        aseprite

        # misc
        normcap # Optical Caracter Recognition (OCR)
        # corekeyboard # not working - name is right
        nextcloud-client # NextCloud Desktop
        speedcrunch
        pdfarranger
        qbittorrent
        # error: 'stacer' has been removed because it was abandoned upstream and relied upon vulnerable software
        # stacer # removed from nixpkgs
        keepassxc
        bulky

        czkawka
        vscodium
        # vscode # cannot install together with vscodium

        # A
        actiona
        anki
        anydesk
        rustdesk
        appflowy
        autokey

        # B
        birdtray
        bleachbit
        boxbuddy
        banana-cursor

        # C
        # cohesion # does not exist in nixpkgs
        cheese
        corectrl
        clapgrep

        # D
        darktable
        discord
        dropbox
        distroshelf # does not show up
        davinci-resolve

        # E
        eyedropper
        espanso-wayland

        # F
        kdePackages.filelight
        fluent-reader
        fontforge

        # G

        # H
        hardinfo2 # system profiler and benchmark
        hakuneko
        handbrake
        haruna
        hexchat

        # I
        imagemagick

        # J
        jitsi-meet-electron # video conference client
        junction # application chooser

        # K
        # kiview # only on flatpak
        kdiskmark
        # error: The top-level kleopatra alias has been removed.
        # kleopatra # certificate manager
        kdePackages.partitionmanager
        kanata

        # L
        libreoffice
        libresprite
        lmms
        localsend
        losslesscut-bin
        logseq
        lact

        # M
        mpv
        mediainfo
        # morgen # electron error
        mission-center
        masterpdfeditor

        # N
        newsflash

        # O
        openrgb
        onlyoffice-desktopeditors

        # P
        penpot-desktop # not found - name is right
        # photoscape # not found - does not exist in nixpkgs
        piper

        # Q
        qpwgraph
        qdirstat
        qsynth
        #quiterss # does not build - insecure library + no compiling

        # R
        reaper
        remmina
        retroarch # does not have a configuration
        rustdesk

        # S
        scrcpy # android screen mirror
        scantailor-advanced # post processing for scanned pages
        # error: The top-level skanlite alias has been removed.
        # skanlite # image scaling
        szyszka # bulk file renamer
        screenkey
        # error: The top-level skanpage alias has been removed.
        # skanpage
        solaar

        # T
        tenacity
        thunderbird
        tiled
        tor-browser

        # U
        upscayl
        unzip

        # V
        vidcutter # does not install - name is right
        vlc

        # W

        # X
        #xvkbd # virtual keyboard for x11

        # Y
        # error: The top-level yakuake alias has been removed.
        kdePackages.yakuake # does not have a configuration

        # Z
        zoom
        zotero
        zig # was needed for neovim to stop showing errors

      ]) # (with pkgs;
      # Stable Packages

      ++

        # Unstable Packages
        (with pkgs-unstable; [

          freetube
          #neovim

          stripe-cli
        ]) # (with pkgs-unstable;
    # Unstable Packages

    ; # home.packages

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
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
    # error: The option `programs.home-manager.backupFileExtension' does not exist. Definition values:
    # error persists after changing it's place
    # use `... -b backup` command flag
    # programs.home-manager.backupFileExtension = "backup";

  }; # config
}

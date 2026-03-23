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
    ./modules/development/game_development/godot.nix
  ]; # imports

  config = {
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

        chezmoi # dotfiles manager # no config
        alejandra # nix formatter
        nixd # nix language server
        nixfmt
        statix # lints and suggestions
        #nvf # neovim configuration and plugin manager - installed in a different way

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
        gearlever
        # warehouse # not found - install through flatpak
        # flatseal # not found - install through flatpak
        protontricks
        winetricks
        devbox

        # GUIs
        # espanso
        redshift

        # Games
        lutris # does not have a configuration
        antimicrox # does not have a configuration
        # lime3ds # not found? no error? deprecated
        # ryujinx # error: 'ryujinx' has been replaced by 'ryubing' as the new upstream
        ryubing
        heroic
        mgba
        vbam
        duckstation
        sameboy
        stella
        kega-fusion
        # snes9x
        # snes9x-gtk
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
        vkd3d-proton
        # TODO get them from other means
        # citra # not found - install through flatpak?
        # azahar # 3DS Emulator # does not open .3ds files anymore
        #azahar # does not install - name is right
        #azahar # does not have a configuration

        # Internet

        # Images
        inkscape
        blender
        krita
        flameshot
        converseen
        gimp

        # Videos
        # avidemux # nixos version is bugged on wayland the flatpak version also is bugged

        # programming
        zed
        nodejs
        pnpm
        svelte-language-server
        vsce # Visual Studio Code Extension Manager cli
        yarn
        typescript
        # vscodium # hassle without all extensions
        vscode # cannot install together with vscodium

        # Game Dev
        # godot # using the Unstable version (newer)
        gdevelop # does not install - name is right
        aseprite
        ueviewer

        # misc
        # corekeyboard # not working - name is right
        # error: 'stacer' has been removed because it was abandoned upstream and relied upon vulnerable software
        # stacer # removed from nixpkgs

        ##########################################################################################
        ##########################################################################################
        ##########################################################################################
        ##########################################################################################
        ##########################################################################################

        # A
        actiona
        anytype
        anki
        anydesk
        rustdesk
        appflowy
        autokey
        atuin

        # B
        bazecor
        birdtray
        bleachbit
        boxbuddy
        bulky
        banana-cursor
        breeze-hacked-cursor-theme

        # C
        # cohesion # does not exist in nixpkgs
        clapgrep
        cheese
        corectrl
        czkawka # file duplicate finder
        # coolercontrol # need to use enable = true

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
        # firefox # installed system-wide
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
        keepassxc
        # kiview # only on flatpak
        kdiskmark
        # error: The top-level kleopatra alias has been removed.
        # kleopatra # certificate manager
        kdePackages.kate
        kdePackages.kdenlive
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
        nextcloud-client # NextCloud Desktop
        newsflash
        normcap # Optical Caracter Recognition (OCR) from screenshot

        # O
        obsidian
        obs-studio
        openrgb
        onlyoffice-desktopeditors

        # P
        pdfarranger
        penpot-desktop # not found - name is right
        # photoscape # not found - does not exist in nixpkgs
        piper
        kdePackages.partitionmanager

        # Q
        qbittorrent
        qpwgraph
        qdirstat
        qsynth
        #quiterss # does not build - insecure library + no compiling

        # R
        resources
        reaper
        remmina
        retroarch # does not have a configuration
        rustdesk
        libratbag

        # S
        speedtest # conflict with cli
        # speedtest-cli # conflict with gui
        speedcrunch
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
          yt-dlp
          tartube-yt-dlp
          godot # better leave it for specific shell
        ])
    # (with pkgs-unstable;
    # Unstable Packages
    ; # home.packages
  }; # config
}

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
        devbox

        # GUIs
        # espanso
        redshift

        # Internet

        # Images
        blender
        flameshot

        # Videos
        # avidemux # nixos version is bugged on wayland the flatpak version also is bugged

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
        discord
        dropbox
        distroshelf # does not show up

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

        # I

        # J
        junction # application chooser

        # K
        keepassxc
        # kiview # only on flatpak
        kdiskmark
        # error: The top-level kleopatra alias has been removed.
        # kleopatra # certificate manager
        kdePackages.kate
        kanata

        # L
        localsend
        logseq
        lact

        # M
        # morgen # electron error
        mediainfo
        mission-center

        # N
        nextcloud-client # NextCloud Desktop
        newsflash
        normcap # Optical Caracter Recognition (OCR) from screenshot

        # O
        obsidian
        obs-studio
        openrgb

        # P
        penpot-desktop # not found - name is right
        # photoscape # not found - does not exist in nixpkgs
        piper
        libratbag # for piper
        kdePackages.partitionmanager

        # Q
        qbittorrent
        qdirstat
        #quiterss # does not build - insecure library + no compiling

        # R
        resources
        remmina
        rustdesk

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
        tor-browser

        # U
        upscayl
        unzip

        # V
        # vscodium # hassle without all extensions
        vscode # cannot install together with vscodium

        # W

        # X
        #xvkbd # virtual keyboard for x11

        # Y
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
        ])
    # (with pkgs-unstable;
    # Unstable Packages
    ; # home.packages
  }; # config
}

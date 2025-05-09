{ config, pkgs, pkgs-unstable, lib, inputs, userSettings, ... }:

{
  imports = [
    ./modules/sh.nix
    ./modules/cli.nix
    ./modules/web_browsers.nix
  ]; # imports

  config = {
    news.display = "silent";

    home.username = "${userSettings.username}";
    home.homeDirectory = "/home/${userSettings.username}";
    
    targets.genericLinux.enable = true; # enable this on non-nixos 

    # You should not change this value, 
    # even if you update Home Manager. 
    # If you do want to update the value, 
    # then make sure to first check the Home Manager release notes.
    home.stateVersion = "24.11";

    nixpkgs = {
      overlays = [
        inputs.nur.overlay
      ]; # overlays
      config = {
        allowUnfree = true;
      }; # config
    }; # nixpkgs

    #nixpkgs.config.allowUnfreePredicate = with pkgs.lib; pkg: builtins.elem (lib.getName pkg) [
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
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

    #inputs.firefox-addons.packages.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    #];

    nixpkgs.config.permittedInsecurePackages = [
	    "electron-27.3.11"
	    #"qtwebkit-5.212.0-alpha4"
	    "xpdf-4.05"
    ]; # nixpkgs.config.permittedInsecurePackages

    fonts.fontconfig.enable = true;

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages =
      # Stable Packages
      (with pkgs; [

        nerdfonts fira-code fira-code-symbols

        # # It is sometimes useful to fine-tune packages, for example, by applying
        # # overrides. You can do that directly here, just don't forget the
        # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
        # # fonts?
        # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

        chezmoi
        cheat
        nh # nix helper
        alejandra
        nixd
        #nvf # neovim configuration and plugin manager - installed in a different way
        lazygit fzf
        #oh-my-posh
        starship
        #atuin
        eza bat broot fd yazi 
        ripgrep just zoxide zellij xclip

        # Internet
        freetube thunderbird

        # TODO configure other CLI tools
        yt-dlp #spelling?
        tldr thefuck 
        helix ripgrep-all 
        lm_sensors speedtest ranger 
        lf nnn ffmpeg
        # cal # not found
        # xpdf # pdfimages cli program and more # removed as insecure
        s-tui # TUI CPU stress and monitoring utility
        # grub-reboot # not found
        doublecmd # double commander - midnight-commander alternative
        boxxy blesh tig visidata jq 
	      #git-annex 
	      direnv fastfetch powertop dust btop
        bc # calculator
        entr # folder watcher
        # mojo # website scrapper # not found
        feh # image viewer
        # qcalc # not found

        # supporting applications for GUIs
        flatpak gearlever
        # warehouse # not found - install through flatpak?
        # flatseal # not found - install through flatpak?
        boxbuddy devbox bottles

        # GUIs
        resources espanso obsidian bazecor redshift

        # Games
        lutris antimicrox lime3ds
        # citra # not found - install through flatpak?
        #azahar # 3DS Emulator
        #azahar # does not install - name is right


        # Images
        inkscape blender krita 
        flameshot converseen gimp

        # Videos
        kdenlive avidemux obs-studio

        # Game Dev
        # godot-engine - better leave it for specific shell
        # godots # godot version manager - does not exist in nixpkgs
        # gdevelop # does not install - name is right

        # misc
        normcap # Optical Caracter Recognition (OCR)
        # corekeyboard # virtual keyboard
        # corekeyboard # not working - name is right
        nextcloud-client # NextCloud Desktop
        speedcrunch pdfarranger qbittorrent stacer keepassxc bulky
        #alacritty 
        czkawka vscodium
        #vscode

        actiona anki anydesk 
	      #rustdesk 
	      appflowy autokey
        
        birdtray bleachbit

        # cohesion # does not exist in nixpkgs
        cheese corectrl

        # disks # Gnome - will not work in Nix
        darktable discord dropbox

        eyedropper

        filelight fluent-reader fontforge

        ghostty

        hakuneko handbrake haruna hexchat

        imagemagick input-remapper
        #irust # Rust REPL # leave it for a specific shell

        jitsi-meet-electron # video conference client
        junction # application chooser

        # kdeconnect-kde # does not install - name is wrong
        # kiview # only on flatpak
        kdiskmark kleopatra # certificate manager
        
        libreoffice libresprite
        lmms localsend losslesscut-bin
        # logseq # unsafe for using old Electron version

        mpv mediainfo

        newsflash

        openrgb

        # penpot-desktop # not found - name is right
        # photoscape # not found - does not exist in nixpkgs
        piper protontricks

        qpwgraph qdirstat qsynth
        #quiterss # does not build - insecure library + no compiling

        reaper remmina retroarch

        scrcpy # android screen mirror
        scantailor # post processing for scanned pages
        skanlite # image scaling
        hardinfo # system profiler and benchmark
        szyszka # bulk file renamer
        screenkey skanpage solaar

        tenacity thunderbird tiled tor

        upscayl

        # vidcutter # does not install - name is right
        # vir-manager # does not install - name is right
        vlc

        wezterm winetricks

        xvkbd

        yakuake

        zoom zotero zig

      ]) # (with pkgs;
      # Stable Packages

      ++

      # Unstable Packages
      (with pkgs-unstable; [

        #neovim

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
      # EDITOR = "emacs";
      # TESTING = lib.mkDefault "home.nix";
      # FLAKE = "/home/jolitp/dotfiles";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

  }; # config
}


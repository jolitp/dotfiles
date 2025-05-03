{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  imports = [
    ./sh.nix
    ./cli.nix
  ]; # imports



  config = {
    news.display = "silent";

    home.username = "jolitp";
    home.homeDirectory = "/home/jolitp";
    
    targets.genericLinux.enable = true; # enable this on non-nixos 

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "24.11"; # Please read the comment before changing.

    nixpkgs = {
      overlays = [
        inputs.nur.overlay
      ];
      config = {
        allowUnfree = true;
      };
    };

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
    ];

    #inputs.firefox-addons.packages.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    #];

    nixpkgs.config.permittedInsecurePackages = [
	"electron-27.3.11"
	#"qtwebkit-5.212.0-alpha4"
	"xpdf-4.05"
    ];


#    permittedInsecurePackages = [
#      "electron-27.3.11"
#    ];



    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages = 
      # Stable Packages
      (with pkgs; [

        # # It is sometimes useful to fine-tune packages, for example, by applying
        # # overrides. You can do that directly here, just don't forget the
        # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
        # # fonts?
        # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

        nh # nix helper
        #nvf # neovim configuration and plugin manager - installed in a different way
        lazygit fzf
#        oh-my-posh
        starship
#        atuin
        eza bat broot fd yazi ripgrep just zoxide zellij xclip

        # TODO configure other CLI tools
        yt-dlp #spelling?
        tldr yazi thefuck helix ripgrep-all lm_sensors speedtest ranger lf nnn ffmpeg
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

        # Internet
        google-chrome chromium brave 
        #firefox # I can't get to my profile anymore
        librewolf floorp freetube thunderbird

        # Images
        inkscape blender krita flameshot converseen gimp

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
        alacritty czkawka vscodium
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

        #G

        hakuneko handbrake haruna hexchat

        imagemagick input-remapper
        #irust # Rust REPL # leave it for a specific shell

        jitsi-meet-electron # video conference client
        junction # application chooser

        # kdeconnect-kde # does not install - name is wrong
        # kiview # only on flatpak
        kdiskmark kleopatra # certificate manager
        
        libreoffice libresprite lmms localsend losslesscut-bin
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

        zoom zotero

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
#       ".bashrc".source = lib.mkDefault ./home/config/bash/.bashrc;
      ".profile".source = lib.mkDefault ./home/config/bash/.profile;
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
    #  /etc/profiles/per-user/jolitp/etc/profile.d/hm-session-vars.sh
    #
    home.sessionVariables = {
      # EDITOR = "emacs";
      # TESTING = lib.mkDefault "home.nix";
      # FLAKE = "/home/jolitp/dotfiles";
    };


    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    # Git user's configuration
    programs.git = {
      enable = true;
      userName = "jolitp";
      userEmail = "jolitp@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    }; # programs.git

# Vimjoyer video:
# NVF | The Superior Way To Configure Neovim With Nix
# https://www.youtube.com/watch?v=uP9jDrRvAwM
# 
# NVF's manual
# https://notashelf.github.io/nvf/index.xhtml#ch-standalone-hm
    #programs.nvf = {
    #  enable = true;
    #  # your settings need to go into the settings attribute set
    #  # most settings are documented in the appendix
    #  # https://notashelf.github.io/nvf/options
    #  settings = {
    #    vim.viAlias = false;
    #    vim.vimAlias = true;
    #    vim.lsp = {
    #      enable = true;
    #    };
    #  };
    #};

    #programs.neovim = {
    #  enable = true;
    #};

    programs.nh = {
      enable = true;
  #    clean.enable = true;
  #    clean.extraArgs = "--keep-since 7d --keep 10";
      flake = "/home/jolitp/dotfiles";
    };

    programs.alacritty = {
      enable = true;
      settings = {
        
      }; # settings

    }; # programs.alacritty

    programs.firefox = {
      enable = true;

      profiles.jolitp = {
        # bookmarks sync is done using floccus browser extension & NextCloud bookmarks
	#https://floccus.org/

        #bookmarks.configfile = ./home/config/firefox/firefox-bookmarks.html;
        #bookmarks = [
	#  {
        #     name = "MyNisOS";
	#     url = "https://mynixos.com/";
	#  }
	#]; # bookmarks = [

	settings = {
	  # ... look them up
	};
        
        search.engines = {
	  "Nix Packages" = {
	    urls = [
	      {
                template = "https://search.nixos.org/packages";
		params = [
		  { name = "type"; value = "packages"; }
		  { name = "query"; value = "{searchTerms}"; }
		]; # params
		icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
		definedAliases = [ "@np" ];
	      }
	    ]; # urls
	  }; # "Nix Packages"
	}; # search.engines
	search.force = true;

	userChrome = # CSS to change the browser theme
	''  
	''; # userChrome = # CSS to change the browser theme

        #extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
	  darkreader
	  ublock-origin
	  languagetool
	  #enhancer-for-nebula
	  noscript
	  privacy-badger
	  # share-backported # not found
	  sidebery
	  single-file
	  stylebot-web
	  tranquility-1 # tranquility reader
	  translate-web-pages
	  # yet another speeddial # not found
	  enhancer-for-youtube
	  youtube-high-definition
	  downthemall
	  markdownload
	  # whatsapp redirect # not found
	  # whatsend # not found
	  canvasblocker
          # duplicate tabs closer # not found
	  # hide youtube fullscreen controls # not found
	  # medium parser # not found 
	  # path of exile trade - fuzzy search # not found
	  sponsorblock # youtube sponsorblock
	  user-agent-string-switcher # should be the same (without the "string")
	  vimium-c
	  # web signer (softplan) # not found
          floccus
        ]; # extensions

      };
    };

    programs.zellij = {
      enable = true;
      settings = {
        copy_command = "xclip -selection clipboard";
      }; # settings

    }; # programs.zellij


      programs.neovim = {
        enable = true;
        extraPackages = with pkgs; [
          # LazyVim
          lua-language-server
          stylua
          # Telescope
          ripgrep
        ]; # extraPackages = with pkgs;
    
        plugins = with pkgs.vimPlugins; [
          lazy-nvim
        ]; # plugins = with pkgs.vimPlugins;
    
        extraLuaConfig =
          let
            plugins = with pkgs.vimPlugins; [
              # LazyVim
              LazyVim
              bufferline-nvim
              cmp-buffer
              cmp-nvim-lsp
              cmp-path
              cmp_luasnip
              conform-nvim
              dashboard-nvim
              dressing-nvim
              flash-nvim
              friendly-snippets
              gitsigns-nvim
              indent-blankline-nvim
              lualine-nvim
              neo-tree-nvim
              neoconf-nvim
              neodev-nvim
              noice-nvim
              nui-nvim
              nvim-cmp
              nvim-lint
              nvim-lspconfig
              nvim-notify
              nvim-spectre
              nvim-treesitter
              nvim-treesitter-context
              nvim-treesitter-textobjects
              nvim-ts-autotag
              nvim-ts-context-commentstring
              nvim-web-devicons
              persistence-nvim
              plenary-nvim
              telescope-fzf-native-nvim
              telescope-nvim
              todo-comments-nvim
              tokyonight-nvim
              trouble-nvim
              vim-illuminate
              vim-startuptime
              which-key-nvim
              { name = "LuaSnip"; path = luasnip; }
              { name = "catppuccin"; path = catppuccin-nvim; }
              { name = "mini.ai"; path = mini-nvim; }
              { name = "mini.bufremove"; path = mini-nvim; }
              { name = "mini.comment"; path = mini-nvim; }
              { name = "mini.indentscope"; path = mini-nvim; }
              { name = "mini.pairs"; path = mini-nvim; }
              { name = "mini.surround"; path = mini-nvim; }
            ];
            mkEntryFromDrv = drv:
              if lib.isDerivation drv then
                { name = "${lib.getName drv}"; path = drv; }
              else
                drv;
            lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);
          in
          ''
            require("lazy").setup({
              defaults = {
                lazy = true,
              },
              dev = {
                -- reuse files from pkgs.vimPlugins.*
                path = "${lazyPath}",
                patterns = { "" },
                -- fallback to download
                fallback = true,
              },
              spec = {
                { "LazyVim/LazyVim", import = "lazyvim.plugins" },
                -- The following configs are needed for fixing lazyvim on nix
                -- force enable telescope-fzf-native.nvim
                { "nvim-telescope/telescope-fzf-native.nvim", enabled = true },
                -- disable mason.nvim, use programs.neovim.extraPackages
                { "williamboman/mason-lspconfig.nvim", enabled = false },
                { "williamboman/mason.nvim", enabled = false },
                -- import/override with your plugins
                { import = "plugins" },
                -- treesitter handled by xdg.configFile."nvim/parser", put this line at the end of spec to clear ensure_installed
                { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = {} } },
              },
            })
          '';
      }; # extraLuaConfig =
    
      # https://github.com/nvim-treesitter/nvim-treesitter#i-get-query-error-invalid-node-type-at-position
      xdg.configFile."nvim/parser".source =
        let
          parsers = pkgs.symlinkJoin {
            name = "treesitter-parsers";
            paths = (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: with plugins; [
              #c
              lua
            ])).dependencies;
          };
        in
        "${parsers}/parser";
      # xdg.configFile."nvim/parser".source =
    
      # Normal LazyVim config here, see https://github.com/LazyVim/starter/tree/main/lua
      xdg.configFile."nvim/lua".source = ./home/config/neovim/lua;
    
      }; # config
    }

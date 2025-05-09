{
  description = "dotfiles flake";

  inputs = {
    # nixpkgs = {
    #   # url = "github:NixOS/nixpkgs/nixos-23.05"; # His version is 23.05
    # };
    nixpkgs.url = "nixpkgs/nixos-24.11"; # Mine will be a more recent one
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/nur";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # firefox-addons

    # Optional, if you intend to follow nvf's obsidian-nvim input
    # you must also add it as a flake input.
    #obsidian-nvim.url = "github:epwalsh/obsidian.nvim";

    # Required, nvf works best and only directly supports flakes
    #nvf = {
    #  url = "github:notashelf/nvf";
    #  # You can override the input nixpkgs to follow your system's
    #  # instance of nixpkgs. This is safe to do as nvf does not depend
    #  # on a binary cache.
    #  inputs.nixpkgs.follows = "nixpkgs-unstable";
    #  # Optionally, you can also override individual plugins
    #  # for example:
    #  #inputs.obsidian-nvim.follows = "obsidian-nvim"; # <- this will use the obsidian-nvim from your inputs
    #};

    #neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

  }; # inputs

  outputs = { 
      self, 
      nixpkgs, 
      nixpkgs-unstable, 
      home-manager, 
      #nvf, 
      ... 
    }@inputs:
    let
    
      # ---- SYSTEM SETTINGS ---- #
      systemSettings = {
        system_architecture = "x86_64-linux"; # system architecture
        hostname = "snowfire"; # hostname
        #profile = "personal"; # select a profile defined from my profiles directory
        timezone = "America/Chicago"; # select timezone
        locale = "en_US.UTF-8"; # select locale
        sytem_shell = "bash"; # bash or zsh
        #bootMode = "uefi"; # uefi or bios
        #bootMountPath = "/boot"; # mount path for efi boot partition; only used for uefi boot mode
        #grubDevice = ""; # device identifier for grub; only used for legacy (bios) boot mode
        #gpuType = "amd"; # amd, intel or nvidia; only makes some slight mods for amd at the moment
      };
       # ----- USER SETTINGS ----- #
      userSettings = rec {
        username = "jolitp"; # username
        name = "João Luís"; # name/identifier
        email = "jolitp@gmail.com"; # email (used for certain configurations)
        dotfilesDir = "~/dotfiles"; # absolute path of the local repo
        theme = "io"; # selcted theme from my themes directory (./themes/)
        #wm = "hyprland"; # Selected window manager or desktop environment;
                         # must select one in both ./user/wm/ and ./system/wm/
                         # window manager type (hyprland or x11) translator
        #wmType = if ((wm == "hyprland") || (wm == "plasma")) then "wayland" else "x11";
        #browser = "qutebrowser"; # Default browser; must select one from ./user/app/browser/
        #spawnBrowser = if ((browser == "qutebrowser") && (wm == "hyprland")) then "qutebrowser-hyprprofile" else (if (browser == "qutebrowser") then "qutebrowser --qt-flag enable-gpu-rasterization --qt-flag enable-native-gpu-memory-buffers --qt-flag num-raster-threads=4" else browser); # Browser spawn command must be specail for qb, since it doesn't gpu accelerate by default (why?)
        #defaultRoamDir = "Personal.p"; # Default org roam directory relative to ~/Org
        terminal = "alacritty"; # Default terminal command;
        font = "Intel One Mono"; # Selected font
        nerdFont = "IntoneMono Nerd Font";
        fontPkg = pkgs.intel-one-mono; # Font package
        editor = "nvim"; # Default editor;
      };


      lib = nixpkgs.lib;
      system = "x86_64-linux";
      #pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};

      pkgs = import nixpkgs {
        inherit system;
        #legacyPackages.${system};
        config = { allowUnfree = true; };
      };

      #overlays = [
      #  inputs.neovim-nightly-overlay.overlays.default
      #];
    in {

    # System Configurations
    nixosConfigurations = {

      nixos-vm = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      }; # nixos-vm

      speciaArgs = {
        inherit system;
        #inherit pkgs;
        inherit pkgs-unstable;
      };

    }; # nixosConfigurations

    # Home Manager Configurations
    homeConfigurations = {

      # jolitp user's config
      jolitp = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        #inherit pkgs-unstable; # error

        modules = [ 
	  #nvf.homeManagerModules.default # <- this imports the home-manager module that provides the options
          ./home.nix
	  #{
	  #  nixpkgs.overlays = overlays;
	  #}
	]; # modules
        
        extraSpecialArgs = {
          #inherit pkgs;
          inherit pkgs-unstable;
	  inherit inputs;
        };
      }; # jolitp = home-manager.lib.homeManagerConfiguration

    }; # homeConfigurations = {
  }; # outputs

}

{
  description = "dotfiles flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11"; # Mine will be a more recent one
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/nur";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # firefox-addons

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
        hostname = "laptop"; # hostname
        #profile = "personal"; # select a profile defined from my profiles directory
        timezone = "America/Sao_Paulo"; # select timezone
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
        theme = "tokyonight"; # selcted theme from my themes directory (./themes/)
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
    in {

    # System Configurations
    nixosConfigurations = {
      nixos-vm = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./hosts/${systemSettings.hostname}/configuration.nix
        ];
      }; # nixos-vm

      specialArgs = {
        inherit system;
        #inherit pkgs;
        inherit pkgs-unstable;
        inherit systemSettings;
        inherit userSettings;
      };
    }; # nixosConfigurations

    # Home Manager Configurations
    homeConfigurations = {

      # jolitp user's config
      jolitp = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        #inherit pkgs-unstable; # error

        modules = [ 
        ./home/home.nix
	      ]; # modules
        
        extraSpecialArgs = {
          #inherit pkgs;
          inherit pkgs-unstable;
	        inherit inputs;
          inherit userSettings;
        };
      }; # jolitp = home-manager.lib.homeManagerConfiguration

    }; # homeConfigurations = {
  }; # outputs

}

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
        };
      }; # jolitp = home-manager.lib.homeManagerConfiguration

    }; # homeConfigurations = {
  }; # outputs

}

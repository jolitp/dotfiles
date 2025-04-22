{

  description = "My first flake";

  inputs = {
    # nixpkgs = {
    #   # url = "github:NixOS/nixpkgs/nixos-23.05"; # His version is 23.05
    # };
    nixpkgs.url = "nixpkgs/nixos-24.11"; # Mine will be a more recent one
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  }; # inputs

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      nixos-vm = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      }; # nixos-vm
    }; # nixosConfigurations

    homeConfigurations = {
      jolitp = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      }; # nixos
    };
  }; # outputs

}

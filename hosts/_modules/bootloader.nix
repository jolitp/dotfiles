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
  options = {
    bootloader.enable = lib.mkEnableOption "enable grub";
    bootloader.boot.loader.grub.device = lib.mkDefault "nodev";
    bootloader.boot.loader.grub.efiSupport = lib.mkDefault true;
  };
  config = lib.mkIf config.bootloader.enable {

    boot = {
      # Bootloader
      loader = {
        efi.canTouchEfiVariables = true;
        grub = {
          enable = true;
          device = "nodev";
          efiSupport = true;
          useOSProber = true;
          theme = "${
            (pkgs.fetchFromGitHub {
              owner = "catppuccin";
              repo = "grub";
              rev = "0a37ab19f654e77129b409fed371891c01ffd0b9";
              hash = "sha256-jgM22pvCQvb0bjQQXoiqGMgScR9AgCK3OfDF5Ud+/mk=";
            })
          }/src/catppuccin-mocha-grub-theme";
        };
        timeout = 3;
      };
    };

  }; # config = {
}

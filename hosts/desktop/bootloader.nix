{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  userSettings,
  ...
}: {
  config = {
    boot = {
      # Zen 1 (Ryzen 5 1600) freezes/reboots at idle because of deep C-states
      kernelParams = ["processor.max_cstate=1"];

      # Bootloader
      loader = {
        efi.canTouchEfiVariables = true;
        grub = {
          enable = true;
          # by-id because /dev/sdX names change between boots
          device = "/dev/disk/by-id/ata-SSD_512GB_SN-on-the-lable";
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

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
    # Enable OpenGL
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    # Configure the NVIDIA driver
    hardware.nvidia = {
      modesetting.enable = true;
      open = false; # Use the open-source kernel module
      nvidiaSettings = true;
      # GTX 1060 (Pascal) was dropped after 580.xx, newer drivers ignore it
      package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    };

    # Load the nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = [
      "nvidia"
    ];
  }; # config = {
}

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
      # RTX 5060 Ti (Blackwell) only works with the open kernel module
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    # Load the nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = [
      "nvidia"
    ];
  }; # config = {
}

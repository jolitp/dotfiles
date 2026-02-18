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
  config = {

    # Enable OpenGL
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    # Configure the NVIDIA driver
    hardware.nvidia = {
      modesetting.enable = true;
      open = true; # Use the open-source kernel module
      nvidiaSettings = true;
      # package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
        # sync.enable = true;
        offload = {
          enable = true;
          enableOffloadCmd = true;
          # use `nvidia-offload` command to run any program (from terminal) on the nvidia gpu
        };
        # Use the Bus IDs you found earlier
        amdgpuBusId = "PCI:5:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };

    # Load the nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = [
      "modesetting"
      "nvidia"
    ];

  }; # config = {
}

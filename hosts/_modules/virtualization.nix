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
    # Recommended for networking
    networking.networkmanager.enable = true;
    networking.firewall.checkReversePath = false;

    # Enable libvirtd service
    virtualisation.libvirtd.enable = true;

    # Needed for virgl / GL
    hardware.opengl.enable = true;

    # If using Wayland host, also helps:
    services.xserver.enable = true; # or at least proper GPU drivers

    # Enable virt-manager program
    programs.virt-manager.enable = true;

    environment.systemPackages = with pkgs; [
      virt-manager
      virtualbox
    ];

    virtualisation.virtualbox.host.enable = true;

    users.users.jolitp.extraGroups = [ "vboxusers" ];

    # Enable KVM kernel modules (adjust for your CPU type if necessary)
    boot.kernelModules = [ "kvm-amd" ];

    virtualisation = {
      docker = {
        enable = true;
        daemon.settings.features.cdi = true;
      };
      podman = {
        enable = true;
      };
    };
    hardware.nvidia-container-toolkit.enable = true;
  }; # config = {
}

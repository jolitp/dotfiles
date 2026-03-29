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

    # Enable virt-manager program
    programs.virt-manager.enable = true;

    environment.systemPackages = with pkgs; [
      virt-manager
      virtualbox
    ];

    # Enable KVM kernel modules (adjust for your CPU type if necessary)
    boot.kernelModules = [ "kvm-amd" ];

    virtualisation.docker = {
      enable = true;
    };
  }; # config = {
}

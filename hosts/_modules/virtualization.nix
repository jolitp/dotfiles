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

    # Enable libvirtd service
    virtualisation.libvirtd.enable = true;

    # Enable virt-manager program
    programs.virt-manager.enable = true;

    environment.systemPackages = with pkgs; [
      virt-manager
    ];

    # Enable KVM kernel modules (adjust for your CPU type if necessary)
    boot.kernelModules = [ "kvm-amd" ];

    virtualisation.docker = {
      enable = true;
    };

  }; # config = {
}

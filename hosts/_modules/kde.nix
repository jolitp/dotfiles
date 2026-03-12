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
    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
    catppuccin.sddm = {
      enable = true;
      flavor = "mocha";
      accent = "mauve";
      clockEnabled = true;
      loginBackground = true;
      userIcon = true;
    };

    services.desktopManager.plasma6.enable = true;

    environment.systemPackages = with pkgs; [
      kdePackages.karousel
    ];
  }; # config = {
}

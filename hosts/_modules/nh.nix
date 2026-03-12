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
    programs.nh = {
      enable = true;
      flake = "/home/${userSettings.username}/dotfiles";

      # needs to be set in the nixos module
      # does not work in the home-manager module
      # it errors out with null
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d";
      clean.dates = "weekly";
    }; # programs.nh
  }; # config = {
}

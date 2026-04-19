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

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages =
      # Stable Packages
      (with pkgs; [
        davinci-resolve
        handbrake
        kdePackages.kdenlive
        vidcutter # does not install - name is right

      ]) # (with pkgs;
      # Stable Packages
      ++
        # Unstable Packages
        (with pkgs-unstable; [

        ])
    # (with pkgs-unstable;
    # Unstable Packages
    ; # home.packages
  }; # config
}

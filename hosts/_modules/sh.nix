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
    # Shells
    environment.shells = with pkgs; [
      bash
      zsh
      fish
    ]; # environment.shells = with pkgs; [
    users.defaultUserShell = pkgs.zsh;

    programs.bash = {
      enable = true;
    }; # programs.bash = {

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      ohMyZsh = {
        enable = true;
        plugins = [
          "git"
          "dirhistory"
          "history"
        ]; # plugins = [
      };
    }; # programs.zsh

    programs.fish = {
      enable = true;
    }; # programs.fish
  }; # config = {
}

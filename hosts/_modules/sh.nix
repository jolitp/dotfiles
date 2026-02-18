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
    # Shells
    environment.shells = with pkgs; [
      bash
      zsh
      fish
    ];
    users.defaultUserShell = pkgs.bash;
    programs.zsh.enable = true;
    programs.fish.enable = true;

  }; # config = {
}

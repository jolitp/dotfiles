{ config, pkgs, pkgs-unstable, lib, inputs, userSettings, ... }:

{
  config = {
    # A
    # TODO move alacritty to a terminals.nix module
    programs.alacritty = {
      enable = true;
      settings = {
        font = {
          normal = {
            #family = "JetBrainsMono";
            family = "FiraCode Nerd Font";
            style = "Regular";
          }; # normal
        }; # font
      }; # settings
    }; # programs.alacritty

    # B
    # C
    # D
    # E
    # F
    # G
    # H
    # I
    # J
    # K
    # L
    # M
    # N
    # O
    # P
    # Q
    # R
    # S
    # T
    # U
    # V
    # W
    # X
    # Y
    # Z
  }; # config
}

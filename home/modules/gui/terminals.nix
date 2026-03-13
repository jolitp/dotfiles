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
    # A
    # TODO move alacritty to a terminals.nix module
    programs.alacritty = {
      enable = true;
      settings = lib.mkForce { };

      # settings = {
      #   font = {
      #     normal = {
      #       #family = "JetBrainsMono";
      #       family = "FiraCode Nerd Font";
      #       style = "Regular";
      #     }; # normal
      #   }; # font
      # }; # settings
    }; # programs.alacritty
    xdg.configFile."alacritty/alacritty.toml".source = ../../config/alacritty/alacritty.toml;

    # B
    # C
    # D
    # E
    # F
    # G
    programs.ghostty.enable = true;

    # H
    # I
    # J
    # K
    programs.kitty.enable = true;

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
    programs.wezterm.enable = true;
    # X
    # Y
    # Z
  }; # config
}

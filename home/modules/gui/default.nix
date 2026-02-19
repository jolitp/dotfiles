{
  config,
  pkgs,
  lib,
  ...
}:
let
in
{
  config = {
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "mauve";
    }; # catppuccin = {

    # qt theme
    qt = {
      enable = true;
      # platformTheme.name = "gtk"; # probably this was the problem
      style.name = "kvantum";
      # style.name = "adwaita-dark";
      # style.package = pkgs.adwaita-qt;
    }; # qt = {

    # gtk theme
    gtk = {
      enable = true;
      # cursorTheme.package = pkgs.bibata-cursors;
      # cursorTheme.name = "Bibata-Modern-Ice";

      # theme.package = pkgs.adw-gtk3;
      # theme.name = "adw-gtk3";

      # iconTheme.package = gruvboxPlus;
      # iconTheme.name = "GruvboxPlus"
      theme = {
        name = "catppuccin-mocha-mauve-standard";
        package = pkgs.catppuccin-gtk.override {
          size = "standard";
          accents = [ "sky" ];
          variant = "mocha";
        }; # package = pkgs.catppuccin-gtk.override {
      }; # theme = {
      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
      gtk4.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
      cursorTheme = {
        name = "Breeze_Hacked";
        package = pkgs.breeze-hacked-cursor-theme;
      }; # cursorTheme = {
    }; # gtk = {

    catppuccin.nvim.enable = false;

    home.pointerCursor = {
      name = "Breeze_Hacked";
      package = pkgs.breeze-hacked-cursor-theme;
      size = 32; # Recommended size
      gtk.enable = true;
      x11.enable = true;
    }; # home.pointerCursor = {
  }; # config
}

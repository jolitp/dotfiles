{ config, pkgs, lib, ... }:
let
in
{
  config = {
    gtk.enable = true;
    qt.enable = true;
  }; # config
}

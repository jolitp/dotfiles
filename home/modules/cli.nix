{ config, pkgs, lib, ... }:
let

in
{
  config = {
    programs.fzf = {
      enable = true;
      enableBashIntegration = true;
    };

  }; # config
}

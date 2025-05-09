{ config, pkgs, lib, ... }:
let

in
{
  config = {
    programs.fzf = {
      enable = true;
      enableBashIntegration = true;
    };

    programs.eza = {
      enable = true;
      #icons = "always";

      git = true;

    }; # programs.eza

    programs.bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "Nord";
      };
    }; # programs.bat

    programs.broot = {
      enable = true;
      settings = {
        ext-colors = {
          nix = "cyan";
	      };

      };
    }; #programs.broot

#    programs.atuin = {
#      enable = true;
#    };

    programs.fd.enable = true;
    programs.yazi.enable = true;
    programs.ripgrep.enable = true;

    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
    };

    programs.zellij = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        theme = "nord";
      };
    };


  }; # config
}

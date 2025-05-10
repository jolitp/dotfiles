{ config, pkgs, pkgs-unstable, lib, inputs, userSettings, ... }:

{
  config = {
    programs.fzf = {
      enable = true;
      enableBashIntegration = true;
    }; # programs.fzf

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
      }; # config
    }; # programs.bat

    programs.broot = {
      enable = true;
      settings = {
        ext-colors = {
          nix = "cyan";
	      }; # ext-colors
      }; # settings
    }; #programs.broot

    programs.fd.enable = true;
    programs.yazi.enable = true;
    programs.ripgrep.enable = true;

    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
    }; # programs.zoxide

    # Git user's configuration
    programs.git = {
      enable = true;
      userName = "${userSettings.username}";
      userEmail = "${userSettings.email}";
      extraConfig = {
        init.defaultBranch = "main";
      }; # extraConfig
    }; # programs.git

    programs.nh = {
      enable = true;
      flake = "/home/${userSettings.username}/dotfiles";

      # needs to be set in the nixos module
      # does not work in the home-manager module
      # it errors out with null
      #clean.enable = true;
      #clean.extraArgs = "--keep-since 7d"; 
    }; # programs.nh

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
    
    programs.zellij = {
      enable = true;
      settings = {
        copy_command = "xclip -selection clipboard";
      }; # settings
      enableBashIntegration = true;
      settings = {
        theme = "nord";
      }; # settings
    }; # programs.zellij

    programs.neovim = {
      enable = true;
      
      vimAlias = true;
      viAlias = true;
    }; # programs.neovim
  }; # config
}

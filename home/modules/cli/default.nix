{ config, pkgs, pkgs-unstable, lib, inputs, userSettings, ... }:

{
  imports = [
  ]; # imports

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
    programs.bat = {
      enable = true;
      config = {
        pager = "less -FR";
      }; # config
    }; # programs.bat

    programs.boxxy.enable = true; # Puts bad Linux applications in a box with only their files

    programs.broot = {
      enable = true;
      settings = {
        ext-colors = {
          nix = "cyan";
	      }; # ext-colors
      }; # settings
    }; #programs.broot
    programs.btop.enable = true;

    # C
    # D
    programs.direnv.enable = true;

    # E
    programs.eza = {
      enable = true;
      #icons = "always";
      git = true;
    }; # programs.eza
    
    # F
    programs.fastfetch.enable = true;
    programs.feh.enable = true;
    programs.fd.enable = true;

    programs.fzf = {
      enable = true;
      enableBashIntegration = true;
    }; # programs.fzf

    # G
    # Git user's configuration
    programs.git = {
      enable = true;
      settings = {
        user.name = "${userSettings.username}";
        user.email = "${userSettings.email}";
      };
      #init.defaultBranch = "main";
    }; # programs.git

    # H
    programs.helix = {
      enable = true;
    };
    programs.htop.enable = true;
    # I
    # J
    programs.jq.enable = true;
    # - The option definition `programs.just.enable' in `/nix/store/(...)-source/home/modules/c…
    #   'program.just' is deprecated, simply add 'pkgs.just' to 'home.packages' instead.
    #programs.just = {
    #  enable = true;
    #};
    # K
    # L
    programs.lazygit = {
      enable = true;
    };
    programs.lf.enable = true;
    # M
    # N
    programs.nnn.enable = true;

    programs.neovim = {
      enable = true;
      extraWrapperArgs = [
        "--prefix" "PATH" ":" "${lib.makeBinPath [ pkgs.gcc ]}"
      ];
      vimAlias = true;
      viAlias = true;
    }; # programs.neovim

    # O
    # P
    # programs.powertop.enable = true; # error

    # Q
    # R
    programs.ranger.enable = true;
    programs.ripgrep.enable = true;

    # S
    programs.starship = {
      enable = true;
# sh.nix imports the TOML file with settings
      # settings = {
      #
      # };
    };
    # T
    #programs.tldr.enable = true; # does not have configuration
    # U
    # V
    # W
    programs.wezterm = {
      enable = true;
      extraConfig = builtins.readFile ./dotfiles/home/config/wezterm/wezterm.lua;
    };

    # X
    # Y
    programs.yazi.enable = true;
    programs.yt-dlp.enable = true;
    
    # Z
    programs.zellij = {
      enable = true;
      settings = {
        copy_command = "xclip -selection clipboard";
      }; # settings
      enableBashIntegration = true;
      settings = {
        theme = "catppuccin-mocha";
      }; # settings
    }; # programs.zellij

    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
    }; # programs.zoxide
  }; # config
}

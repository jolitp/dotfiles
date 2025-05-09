{ config, pkgs, lib, ... }:
let
  myAliases = {
    # TODO change to exa/eza/lsd
    # Listing (ls)
    #ll = "ls -l";
    #la = "ls -a";
    #lla = "ls -la";

    # cd -> broot
    #cd = "broot";

    # ls -> eza
    ls = "eza --group-directories-first --icons ";
    lt = "eza --group-directories-first --icons --tree";
    ll = "eza --group-directories-first --icons --long";
    la = "eza --group-directories-first --icons --all";
    lta = "eza --group-directories-first --icons --tree --all";
    lla = "eza --group-directories-first --icons --long --all";

    # cat -> bat
    cat = "bat";

    # Directory traversal
    ".." = "cd ..";

    # Nvim
    v = "nvim";

    # Git
#    gs = "git status";
#    gl = "git log";
#    ga = "git add";
#    gc = "git commit -m";
#    gpo = "git push -u origin";

    # LazyGit
    lg = "lazygit";

    # Histroy
#    h = "history";
#    hg = "history | grep";

    #Nix
    # TODO replace with NH (Nix helper) later
#    nrs = "sudo nixos-rebuild switch --flake";
#    nfu = "nix flake update";
#    nhms = "home-manager switch --flake";
  }; # myAliases
in
{
  config = {
    programs.bash = {
      enable = true;
      shellAliases = myAliases;
      historyControl = [ "ignoreboth" ];
      historyIgnore = [ "ls" "cd" "exit" ];

      bashrcExtra = ''
        # set variable identifying the chroot you work in (used in the prompt below)
        if [ -z "$\{debian_chroot:-\}" ] && [ -r /etc/debian_chroot ]; then
            debian_chroot=$(cat /etc/debian_chroot)
        fi
        # set a fancy prompt (non-color, unless we know we "want" color)
        case "$TERM" in
            xterm-color|*-256color) color_prompt=yes;;
        esac

        # uncomment for a colored prompt, if the terminal has the capability; turned
        # off by default to not distract the user: the focus in a terminal window
        # should be on the output of commands, not on the prompt
        #force_color_prompt=yes

        # set PATH so it includes user's Applications bin folder if it exists
        if [ -d "$HOME/Applications/bin" ] ; then
            PATH="$HOME/Applications/bin:$PATH"
        fi

        set -o vi

      '';
    }; # programs.bash

    programs.zsh = {
      enable = true;
      shellAliases = myAliases;
    }; # programs.zsh

    home.sessionVariables = {
      TESTING = lib.mkForce "sh.nix";
    };

#    programs.oh-my-posh = {
#      useTheme = "agnoster";
#    };
    programs.starship = {
      enable = true;
        settings =  pkgs.lib.importTOML ./home/config/starship/tokyo-night.toml;
    }; # programs.starship

#    programs.atuin = {
#      enable = true;
#    };

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

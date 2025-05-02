{ config, pkgs, lib, ... }:
let
  myAliases = {
    # TODO change to exa/eza/lsd
    # Listing (ls)
    #ll = "ls -l";
    #la = "ls -a";
    #lla = "ls -la";

    # ls -> eza
    ls = "eza --group-directories-first --icons ";
    lt = "eza --group-directories-first --icons --tree";
    ll = "eza --group-directories-first --icons --long";
    la = "eza --group-directories-first --icons --all";
    lla = "eza --group-directories-first --icons --long --all";

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
#      settings = pkgs.lib.importTOML;
#      settings = {
#        add_newline = true;
#        command_timeout = 1300;
#        scan_timeout = 50;

        # example
#        format = "$all$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status\n$username$hostname$directory";

	# tolyo night
#        format = "[░▒▓](#a3aed2)[ 󱄅 ](bg:#a3aed2 fg:#090c0c)[▓▒░](bg:#769ff0 fg:#a3aed2)$directory[░▒▓](fg:#769ff0 bg:#394260)$git_branch$git_status[▓▒░](fg:#394260 bg:#212736)$nodejs$rust$golang$php[░▒▓](fg:#212736 bg:#1d2230)$time[▓▒░](fg:#1d2230)$character";
#
#	directory = {
#          style = "fg:#e3e5e5 bg:#769ff0";
#          format = "[ $path ]($style)";
#          truncation_length = 3;
#          truncation_symbol = "…/";
#        };
#        
#        directory.substitutions = {
#          Documents = "󱧶 ";
#          "Downloads" = "󰉍 ";
#          "Music" = "󱍙 ";
#          "Pictures" = "󰉏 ";
#        };
#        
#        git_branch = {
#          symbol = "";
#          style = "bg:#394260";
#          format = "[[ $symbol $branch ](fg:#769ff0 bg:#394260)]($style)";
#	};
#        
#        git_status = {
#          style = "bg:#394260";
#          format = "[[($all_status$ahead_behind )](fg:#769ff0 bg:#394260)]($style)";
#	};
#        
#        nodejs = {
#          symbol = "";
#          style = "bg:#212736";
#          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
#	};
#        
#        rust = {
#          symbol = "";
#          style = "bg:#212736";
#          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
#	};
#        
#        golang = {
#          symbol = "";
#          style = "bg:#212736";
#          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
#	};
#        
#        php = {
#          symbol = "";
#          style = "bg:#212736";
#          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
#	};
#        
#        time = {
#          disabled = false;
#          time_format = "%R"; # Hour:Minute Format
#          style = "bg:#1d2230";
#          format = "[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)";
#	};

        # pastel
#       format = "[](#9A348E)$os$username[](bg:#DA627D fg:#9A348E)$directory[](fg:#DA627D bg:#FCA17D)$git_branch$git_status[](fg:#FCA17D bg:#86BBD8)$c$elixir$elm$golang$gradle$haskell$java$julia$nodejs$nim$rust$scala[](fg:#86BBD8 bg:#06969A)$docker_context[](fg:#06969A bg:#33658A)$time[ ](fg:#33658A)";
        settings =  pkgs.lib.importTOML ./home/config/starship/tokyo-night.toml;

#        character = {
#          success_symbol = "[](bold green) ";
#          error_symbol = "[](bold red) ";
#        }; # character
#      }; # settings
    }; # programs.starship

#    programs.atuin = {
#      enable = true;
#    };

    programs.eza = {
      enable = true;
      #icons = "always";

      #extraOptions = [
      #  "--tree"
      #  "--icons"
      #]; # extraOptions

      git = true;

    }; # programs.eza

  }; # config
}

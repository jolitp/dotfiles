{ config, pkgs, lib, ... }:
let
  myAliases = {
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


    #Nix
    # TODO replace with NH (Nix helper) later
    nrs = "nh os switch"; # "sudo nixos-rebuild switch --flake";
    nfu = "nix flake update";
    nhms = "nh home switch"; # "home-manager switch --flake";
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

    programs.starship = {
      enable = true;
        settings =  pkgs.lib.importTOML ./../config/starship/tokyo-night.toml;
    }; # programs.starship
  }; # config
}

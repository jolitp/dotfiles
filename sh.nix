{ config, pkgs, ... }:
let
  myAliases = {
    # TODO change to exa/eza/lsd
    # Listing (ls)
    ll = "ls -l";
    la = "ls -a";
    lla = "ls -la";

    # Directory traversal
    ".." = "cd ..";

    # Git
    gs = "git status";
    gl = "git log";
    ga = "git add";
    gc = "git commit -m";
    gpo = "git push -u origin";

    # Histroy
    h = "history";
    hg = "history | grep";

    #Nix
    # TODO replace with NH (Nix helper) later
    nrs = "sudo nixos-rebuild switch --flake";
    nfu = "nix flake update";
    nhms = "home-manager switch --flake";
  }; # myAliases
in
{
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  }; # programs.bash

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  }; # programs.zsh
}

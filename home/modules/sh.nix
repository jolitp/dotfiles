{
  config,
  pkgs,
  lib,
  ...
}:
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
    programs = {
      bash = {
        enable = true;
        shellAliases = myAliases;
        historyControl = [ "ignoreboth" ];
        historyIgnore = [
          "ls"
          "cd"
          "exit"
        ];

        bashrcExtra = /* bash */ ''
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

      zsh = {
        enable = true;

        history = {
          size = 10000;
          ignoreAllDups = true;
          path = "$HOME/.zsh_history";
          ignorePatterns = [
            "rm *"
            "pkill *"
            "cp *"
          ];
        }; # history = {

        shellAliases = myAliases;

        # Content to be added to .zshrc.
        initContent =
          let
            zshConfigBefore = lib.mkOrder 500 /* bash */ ''
              # 500 (mkBefore): Early initialization (replaces initExtraFirst)
            '';
            zshConfigDefault = lib.mkOrder 1000 /* bash */ ''
              # 1000 (default): General configuration (replaces initExtra)
            '';
            zshConfigAfter = lib.mkOrder 1500 /* bash */ ''
                  # 1500 (mkAfter): Last to run configuration
              #
                  # set PATH so it includes user's Applications bin folder if it exists
                  if [ -d "$HOME/Applications/bin" ] ; then
                      PATH="$HOME/Applications/bin:$PATH"
                  fi

                  set -o vi

            '';
          in
          lib.mkMerge [
            zshConfigBefore
            zshConfigDefault
            zshConfigAfter
          ];
      }; # programs.zsh = {

      starship = {
        enable = true;
        # settings =  pkgs.lib.importTOML ./../config/starship/tokyo-night.toml;
        settings = pkgs.lib.importTOML ./../config/starship/catppuccin-mocha-changed.toml;
      }; # programs.starship
    }; # programs = {
  }; # config
}

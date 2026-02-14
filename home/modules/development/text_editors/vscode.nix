{ config, pkgs, pkgs-unstable, lib, inputs, userSettings, ... }:

{
  config = {
    programs.vscode = {
      enable = true;
      # package = pkgs.vscodium
      package = pkgs.vscode

      # https://wiki.nixos.org/wiki/Visual_Studio_Code
      profiles.default.extensions = with pkgs.vscode-extensions; [
        ms-python.python
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "remote-ssh-edit";
          publisher = "ms-vscode-remote";
          version = "0.47.2";
          sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
        }
      ]; # ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [

      profiles = {
        default = {
          enable = true;
          enableUpdateCheck = false;
          userSettings = {
              "workbench.colorTheme" = "Catppuccin Mocha",
              "svelte.enable-ts-plugin" = true,
              "workbench.sideBar.location" = "right",
              "editor.fontFamily" = "'JetBrains Mono', 'Fira Code', 'Droid Sans Mono', 'monospace', monospace",
              "editor.fontLigatures" = true,
              "explorer.confirmDelete" = false,
              "workbench.iconTheme" = "material-icon-theme",
              "git.openRepositoryInParentFolders" = "never",
              "editor.formatOnSave" = true,
              "editor.tabSize" = 2,
              "editor.tabCompletion" = "on",
              "workbench.editor.highlightModifiedTabs" = true,
              "liveServer.settings.donotShowInfoMsg" = true,
              "editor.wordWrap" = "bounded",
              "explorer.compactFolders" = false,
              "test" = "test",
          }; # userSettings = {
        }; # default = {
      }; # profiles = {

    };

  };
}

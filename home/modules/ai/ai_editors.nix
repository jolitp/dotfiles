{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [

    # AI editors
    zed-editor
    code-cursor
    windsurf

    # AI CLI
    claude-code
    codex
    gemini-cli-bin

  ];
}

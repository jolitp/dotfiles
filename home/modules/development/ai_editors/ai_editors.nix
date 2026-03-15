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
    cursor
    windsurf

    # AI CLI
    claude-code
  ];
}

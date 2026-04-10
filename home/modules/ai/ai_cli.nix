{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    # General AI CLI
    gemini-cli-bin
    chatgpt-cli
    aider-chat

    # Code AI CLI
    claude-code
    codex
    opencode

  ];
}

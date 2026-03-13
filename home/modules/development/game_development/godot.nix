{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  userSettings,
  ...
}:
let
  godotMono = pkgs.writeShellScriptBin "godot-mono" ''
    exec ${pkgs.godot-mono}/bin/godot "$@"
  '';
in
{
  environment.systemPackages = with pkgs-unstable; [
    godot
    godotMono
  ]; # environment.systemPackages = with pkgs; [

}

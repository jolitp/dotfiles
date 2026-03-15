{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  userSettings,
  ...
}:
{
  home.packages = with pkgs-unstable; [
    # Godot
    godot
    godot-mono

    # .NET
    dotnet-sdk_8
    # dotnet-sdk

    # C# tooling
    omnisharp-roslyn

    # Required runtime libs
    icu
    zlib
    openssl

    glib
  ]; # environment.systemPackages = with pkgs; [

}

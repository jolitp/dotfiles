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
  config = {
    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;
    programs.gamemode.enable = true;

    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
      # Add any missing dynamic libraries for unpackaged programs
      # here, NOT in environment.systemPackages

    ];

    programs.firefox.enable = true;

    programs.gnome-disks.enable = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      lshw
      lshw-gui
      pciutils
      nvd

      vim
      wget
      keepassxc
      git
      mangohud
      protonup-ng # gamming proton
      bottles
      kdePackages.kdeconnect-kde
      ddcutil
      distrobox
      ntfs3g
      protonvpn-gui # privacy proton
      protonmail-bridge-gui # privacy proton
      # corekeyboard # x11 only
      maliit-keyboard

      dnsmasq
      catppuccin-sddm
      python3
      uv
      playwright
      stdenv.cc.cc.lib

      fuse
      appimage-run
      just
    ];
  }; # config
}

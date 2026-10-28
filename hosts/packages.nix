{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  userSettings,
  openspec,
  ...
}:
{
  config = {
    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;
    # programs.gamemode.enable = true;

    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
      # Add any missing dynamic libraries for unpackaged programs
      # here, NOT in environment.systemPackages
      icu
      openssl
      zlib
      curl
      libunwind
      stdenv.cc.cc
      p7zip
      # p7zip-rar

      nvidia-container-toolkit
      steam
      cabextract
    ];

    programs.firefox.enable = true;

    programs.gnome-disks.enable = true;

    nixpkgs.overlays = [
      (final: prev: {
        openspec = inputs.openspec.packages.${prev.stdenv.hostPlatform.system}.default;
      })
    ];

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      lshw
      lshw-gui
      pciutils
      nvd
      icu
      libcxx
      yarn-berry
      kdePackages.kio-fuse # fix dolphin not showing mounted iso

      # for godot mono (C#)
      openssl
      zlib
      libunwind
      libuuid
      curl
      stdenv.cc.cc

      vim
      wget
      keepassxc
      git
      mangohud
      protonup-ng # gamming proton
      # bottles # going to install through flatpak
      kdePackages.kdeconnect-kde
      ddcutil
      distrobox
      ntfs3g
      proton-vpn # privacy proton
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
      openspec

    ];
  }; # config
}

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

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages =
      # Stable Packages
      (with pkgs; [

        ryubing
        heroic
        mgba
        vbam
        duckstation
        sameboy
        stella
        kega-fusion
        snes9x
        # snes9x-gtk
        mame
        mesen
        melonDS
        desmume
        yabause
        gopher64
        mupen64plus
        flycast
        pcsx2
        dolphin-emu
        cemu
        xemu
        # gens-gs
        # TODO get them from other means
        # citra # not found - install through flatpak?
        # azahar # 3DS Emulator # does not open .3ds files anymore
        #azahar # does not install - name is right
        #azahar # does not have a configuration

        (retroarch.withCores (
          cores: with cores; [

            ############################
            # 🟥 Nintendo
            ############################

            # snes9x # SNES
            bsnes # SNES (more accurate, heavier)

            # fceumm # NES
            nestopia # NES (alternative, more accurate)

            gambatte # Game Boy / Game Boy Color
            mgba # Game Boy Advance

            # melonds # Nintendo DS
            # desmume # Nintendo DS (alternative)

            mupen64plus # Nintendo 64

            # citra                # Nintendo 3DS (often broken / not in nixpkgs)

            ############################
            # 🔵 Sega
            ############################

            genesis-plus-gx # Mega Drive / Genesis + Master System + Game Gear
            picodrive # Genesis + 32X (lighter)

            # flycast # Dreamcast / Naomi / Atomiswave

            ############################
            # 🟡 Sony
            ############################

            # pcsx_rearmed # PlayStation 1 (fast, lightweight)
            # duckstation # PlayStation 1 (better accuracy)

            # pcsx2               # PS2 (NOT a libretro core → use standalone)

            ############################
            # 🟣 Arcade
            ############################

            # fbneo # FinalBurn Neo (modern arcade core ✅)

            # mame                # MAME core (heavy, sometimes finicky)

            ############################
            # 🟢 Other Consoles
            ############################

            # stella # Atari 2600
            # sameboy # Game Boy (high accuracy alternative)
            # beetle_pce # PC Engine / TurboGrafx-16

            ############################
            # 💻 Experimental / Advanced
            ############################

            # beetle_psx # PS1 (very accurate, heavy)
            # beetle_psx_hw # PS1 with hardware rendering

            # parallel_n64 # N64 (high accuracy, Vulkan needed)

          ]
        ))
      ]) # (with pkgs;
      # Stable Packages
      ++
        # Unstable Packages
        (with pkgs-unstable; [

        ])
    # (with pkgs-unstable;
    # Unstable Packages
    ; # home.packages
  }; # config
}

{
  config,
  pkgs-unstable,
  ...
}:
let
  kanata = pkgs-unstable.kanata;
in
{
  config = {
    home.packages = [ kanata ];

    xdg.configFile."kanata/mouse.kbd".text = ''
      (defcfg
        linux-dev /dev/input/by-id/usb-Compx_2.4G_Wireless_Receiver-if01-event-kbd:/dev/input/by-id/usb-Compx_2.4G_Wireless_Receiver-event-mouse
        linux-continue-if-no-devs-found yes
      )

      (defsrc
        caps
        bspc del  mbck mfwd
        tab  esc  ret  spc
        lalt lctl lsft lmet
      )

      (defalias
        ;; Tap: switch to game layer. Hold: Caps Lock
        to-game (tap-hold 200 500 (layer-switch game) caps)
        ;; Tap: back to base layer. Hold: -
        to-base (tap-hold 200 500 (layer-switch base) -)
      )

      ;; Everyday use: buttons behave as they do today
      (deflayer base
        @to-game
        bspc del  mbck mfwd
        tab  esc  ret  spc
        lalt lctl lsft lmet
      )

      ;; Game mode: right-side keyboard block
      (deflayer game
        @to-base
        7    8    9    0
        u    i    o    p
        j    k    l    scln
      )
    '';

    systemd.user.services.kanata-mouse = {
      Unit = {
        Description = "Kanata remapping for the MMO mouse";
        After = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${kanata}/bin/kanata --cfg ${config.xdg.configHome}/kanata/mouse.kbd";
        Restart = "on-failure";
        RestartSec = 3;
      };
      Install.WantedBy = [ "graphical-session.target" ];
    };
  };
}

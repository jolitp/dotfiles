{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.ollama = {
    enable = true;
    acceleration = "cuda"; # or "rocm" / "none"
  };

  environment.systemPackages = with pkgs; [
    open-webui
    lmstudio
  ];
  systemd.services.open-webui = {
    description = "Open WebUI";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = ''
        ${pkgs.open-webui}/bin/open-webui serve
      '';
      Environment = [
        "OPEN_WEBUI_DATA_DIR=/home/jolitp/.local/share/open-webui"
      ];
      Restart = "always";
    };
  };
}

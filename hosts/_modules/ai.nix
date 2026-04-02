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
  ];

  systemd.services.open-webui = {
    description = "Open WebUI";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.open-webui}/bin/open-webui serve";
      Restart = "always";
    };
  };
}

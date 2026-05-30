{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    xanterella = {
      soomfon = {
        enable = lib.mkEnableOption "Aktiviert soomfon";
      };
    };
  };

  config = lib.mkIf config.xanterella.soomfon.enable {
    environment = {
      systemPackages = with pkgs; [
        streamcontroller
      ];
    };
    programs.streamdeck-ui = {
      enable = true;
      autoStart = true; # optional
    };
  };
}

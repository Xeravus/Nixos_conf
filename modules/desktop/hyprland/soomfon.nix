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
    programs.streamdeck-ui = {
      enable = true;
      autoStart = true; # optional
    };
  };
}

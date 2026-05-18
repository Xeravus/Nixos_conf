{
  config,
  pkgs,
  lib,
  pkgs-new,
  inputs,
  ...
}: {
  options = {
    xanterella.alejandra.enable = lib.mkEnableOption "Aktiviert Alejandra";
  };

  config = lib.mkIf config.xanterella.alejandra.enable {
    environment.systemPackages = with pkgs-new; [
      inputs.alejandra.defaultPackage.${pkgs.system}
    ];
  };
}

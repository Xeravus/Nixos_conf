{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    xanterella.tailscale.enable = lib.mkEnableOption "Aktiviert tailscale";
  };

  config = lib.mkIf config.xanterella.tailscale.enable {
    environment.systemPackages = with pkgs; [
      tailscale
    ];
    services = {
      tailscale = {
        enable = true;
      };
      resolved = {
        enable = true;
      };
    };
    networking = {
      nameservers = [
        "100.100.100.100"
        "1.1.1.1"
        "1.0.0.1"
        "8.8.8.8"
      ];
      search = [
        "gute-nessie.ts.net"
      ];
    };
  };
}

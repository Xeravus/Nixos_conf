{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    xanterella.caddy.enable = lib.mkEnableOption "Aktiviert caddy";
  };

  config = lib.mkIf config.xanterella.caddy.enable {
    environment.systemPackages = with pkgs; [
      caddy
    ];
    services = {
      caddy = {
        enable = true;
        virtualHosts = {
          "vicuna.gute-nessie.ts.net" = {
            extraConfig = ''
              reverse_proxy localhost:8222
            '';
          };
        };
      };
      tailscale = {
        permitCertUid = "caddy";
      };
    };
  };
}

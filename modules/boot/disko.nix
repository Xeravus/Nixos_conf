{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    xanterella.disko.enable = lib.mkEnableOption "Aktiviert Disko";
  };
  config = lib.mkIf config.xanterella.disko.enable {
    disko = {
      devices = {
        disk = {
          main = {
            type = "disk";
            device = "/dev/nvme0n1";
            content = {
              type = "gpt";
              partitions = {
                ESP = {
                  priority = 1;
                  name = "boot";
                  start = "1M";
                  end = "512M";
                  type = "EF00";
                  content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = "/boot";
                    mountOptions = ["defaults"];
                  };
                };
                root = {
                  size = "100%";
                  content = {
                    type = "filesystem";
                    format = "ext4";
                    mountpoint = "/";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}

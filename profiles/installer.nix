{
  config,
  lib,
  pkgs,
  ...
}: {
  config = {
    xanterella = {
      local = {
        enable = true;
      };
    };
  };
}

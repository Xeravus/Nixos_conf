{
  config,
  lib,
  ...
}: {
  config = {
    xanterella = {
      gdm.enable = true;
      gnome.enable = true;
      power-profiles-daemon.enable = true;
      zen-browser.enable = true;
    };
  };
}

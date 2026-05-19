{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./../../modules
    ./../../profiles/boot.nix
    ./../../profiles/essentials.nix
    ./../../profiles/desktop.nix
    ./../../modules/boot/disko.nix
  ];
  networking.hostName = "willma";
  system.stateVersion = "25.11"; # Did you read the comment?
}

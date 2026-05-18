{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
  ];
  isoImage = {
    squashfsCompression = "zstd";
  };

  networking = {
    networkManager = {
      enable = true;
    };
  };

  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "yes";
      };
    };
  };

  systemd = {
    services = {
      tailscale-autoconnect = {
        description = "Automatische Verbindung für Remote Install";
        after = [
          "tailscaled.service"
          "network-online.target"
        ];
        wants = [
          "tailscaled.service"
          "network-online.target"
        ];
        wantedBy = [
          "multi-user.target"
        ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
        };
        script = ''
          until ${pkgs.curl}/bin/curl -s https://login.tailscale.com > /dev/null; do
          sleep 1
          done

          ${pkgs.tailscale}/bin/tailscale up --authkey="tskey-auth-ky2tsoWjpZ11CNTRL-MGcuN6WPCVjM1DkUL3FHWjcBMWarHwUz" --unattended
        '';
      };
    };
  };
}

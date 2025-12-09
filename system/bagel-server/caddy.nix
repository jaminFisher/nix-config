{ config, ... }: {
  services.caddy = {
    enable = true;
    # Configure each service with a unique hostname and port
    virtualHosts."jellyfin.${config.services.tailscale.tailnetName}".extraConfig =
      ''
        reverse_proxy 127.0.0.1:8920
      '';
    virtualHosts."audiobooks.${config.services.tailscale.tailnetName}".extraConfig =
      ''
        reverse_proxy 127.0.0.1:8000
      '';
    virtualHosts."photos.${config.services.tailscale.tailnetName}".extraConfig =
      ''
        reverse_proxy 127.0.0.1:2283
      '';
    # Add more services as needed, each with a unique hostname and port
  };
  services.tailscale.permitCertUid = "caddy";

}


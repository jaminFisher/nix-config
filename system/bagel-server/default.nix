{ inputs, outputs, ... }:
{
  imports = [
    ../generic
    ./hardware-configuration.nix
    ./samba.nix
    ./immich.nix
    ./jellyfin.nix
    ./mealie.nix
    ./glance.nix
    ./blocky.nix
    ./pinchflat.nix
    ./caddy.nix
    ./audiobookshelf.nix
    ./homepage.nix
  ];

  hardware.enableRedistributableFirmware = true;
  # Hostname
  networking.hostName = "bagel-server";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  # Tailscale
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "server";
  };

  # Vaultwarden
  services.vaultwarden.enable = true;

  services.filebrowser = {
    enable = true;
    settings = {
      port = 8787;
      root = "/";
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      jaminfisher = import ../../home-manager/system/wsl.nix;
    };
  };

  users = {
    groups = {
      media.gid = 1100;
    };
  };
  users.users.jaminfisher.extraGroups = [ "media" ];

  systemd.tmpfiles.rules = [ "d /mnt/Seagate 2775 root media -" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

}

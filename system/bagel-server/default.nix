{
  inputs,
  outputs,
  ...
}:
{
  imports = [
    ../generic
    ./hardware-configuration.nix
    ./samba.nix
    ./immich.nix
    ./jellyfin.nix
    ./mealie.nix
    ./glance.nix
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

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
    };
    users = {
      # Import your home-manager configuration
      jaminfisher = import ../../home-manager/system/wsl.nix;
    };
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

}

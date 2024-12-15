{ inputs, outputs, ... }:
{
  imports = [
    ../generic/configuration.nix
    ./hardware-configuration.nix
  ];

  hardware.enableRedistributableFirmware = true;
  # Hostname
  networking.hostName = "bagel-server";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;
  services.tailscale.enable = true;

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
    };
    users = {
      # Import your home-manager configuration
      jaminfisher = import ../../home-manager/system/wsl.nix;
    };
  };

  # Bootloader
  boot.loader.grub = {
    enable = true;
    device = "/dev/disk/by-uuid/F065-F3BB";
    useOSProber = true;
  };
}

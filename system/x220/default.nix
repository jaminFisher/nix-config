{
  pkgs,
  inputs,
  outputs,
  ...
}:
{
  imports = [
    ../generic/configuration.nix
    ./i3.nix
    ./hardware-configuration.nix
  ];

  hardware.enableRedistributableFirmware = true;
  # Hostname
  networking.hostName = "x220";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;
  services.tailscale.enable = true;
  # networking.networkmanager.unmanaged =
  #   [ "*" "except:type:wwan" "except:type:gsm" ];
  networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  #networking.wireless.userControlled.enable = true;

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
    };
    users = {
      # Import your home-manager configuration
      jaminfisher = import ../../home-manager/systems/x220.nix;
    };
  };

  # Bootloader
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };
}

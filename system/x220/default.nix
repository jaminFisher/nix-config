{ pkgs, inputs, ... }: {
  imports =
    [ ../generic/configuration.nix ./xfce-i3.nix ./hardware-configuration.nix ];

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

  # Bootloader
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };
}

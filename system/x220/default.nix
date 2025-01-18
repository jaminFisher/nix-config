{ pkgs, inputs, ... }: {
  imports =
    [ ../generic/configuration.nix ./gnome.nix ./hardware-configuration.nix ];

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

  environment.systemPackages = with pkgs; [ firefox ghostty ];
  # Bootloader
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };
}

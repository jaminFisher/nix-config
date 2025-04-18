{
  pkgs,
  inputs,
  outputs,
  ...
}:
{
  imports = [
    ../generic
    ./gnome.nix
    ./hardware-configuration.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      jaminfisher = import ../../home-manager/system/x220.nix;
    };
  };
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
  environment.variables.EDITOR = "hx";
  environment.systemPackages = with pkgs; [
    ytdl-sub
    brave
    firefox
    ghostty
    gnomeExtensions.pop-shell
  ];
  # Bootloader
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };
}

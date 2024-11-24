{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

    # Hostname
  networking.hostName = "x220";
  networking.networkmanager.enable = true;
  services.tailscale.enable = true;

    # Bootloader
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };
}
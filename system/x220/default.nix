{ pkgs, inputs, ... }:
{
  imports = [
    ../generic/configuration.nix
    ./xfce_i3.nix
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

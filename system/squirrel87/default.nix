{
  pkgs,
  inputs,
  outputs,
  ...
}:
{
  imports = [
    ../generic
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
  networking.hostName = "squirrel87"; # Define your hostname.

  networking.networkmanager.enable = true;
  programs.networkmanager.enable = true;
  services.tailscale.enable = true;

  environment.variables.EDITOR = "hx";
  environment.systemPackages = with pkgs; [
    nmtui
    brave
    ghostty
  ];

  # Sound
  hardware.pulseaudio.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
}

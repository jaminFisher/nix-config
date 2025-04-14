{ pkgs, inputs, outputs, ... }: {
  imports = [ ../generic ./hardware-configuration.nix ./i3.nix ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      jaminfisher = import ../../home-manager/system/squirrel87.nix;
    };
  };
  hardware.enableRedistributableFirmware = true;
  # Hostname
  networking.hostName = "squirrel87"; # Define your hostname.

  networking.networkmanager.enable = true;
  services.tailscale.enable = true;

  environment.variables = {
    EDITOR = "hx";
    TERMINAL = "ghostty";
  };
  environment.systemPackages = with pkgs; [ brave ghostty xorg.xev ];

  # Sound
  services.pulseaudio.enable = false;
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

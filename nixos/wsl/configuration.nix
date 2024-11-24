# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, lib, config, pkgs, outputs, ... }: {
  # You can import other NixOS modules here
  imports = [
    inputs.home-nixos-wsl.nixosModules.home-manager
  ];

  nixos-wsl.nixosModules.default = 
          {
            system.stateVersion = "24.05";
            wsl.enable = true;
          };
    environment.systemPackages = with pkgs; [ nh ];
}

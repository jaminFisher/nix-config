# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, lib, config, pkgs, outputs, nixos-wsl, ... }: {
  # You can import other NixOS modules here
  imports = [
    ./generic/configuration.nix
  ];
    environment.systemPackages = with pkgs; [ nh ];

    nixos-wsl.nixosModules.default
          {
            system.stateVersion = "24.05";
            wsl.enable = true;
            wsl.defaultUser = jaminfisher;
          }; 
}

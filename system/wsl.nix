# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{
  inputs,
  lib,
  config,
  pkgs,
  outputs,
  nixos-wsl,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [ ./generic/configuration.nix ];
  environment.systemPackages = with pkgs; [
    nh
    wget
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
    };
    users = {
      # Import your home-manager configuration
      jaminfisher = import ../home-manager/system/wsl.nix;
    };
  };

  networking.hostName = "nix-wsl";
  services.tailscale.enable = true;
  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs; # only for NixOS 24.05
  };

}

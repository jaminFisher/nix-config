{ pkgs, ... }:
{
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    gnupg
    sops
    nixd
    nh
  ];
}

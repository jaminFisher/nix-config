{ pkgs, ... }:
{
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    git
    gnupg
    sops
    nixd
    nh
    glances
    systemd-manager-tui
  ];
}

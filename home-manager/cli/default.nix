{ pkgs, ... }:
{
  imports = [
    ./starship.nix
    ./git.nix
    ./helix.nix
    ./zsh.nix
    ./broot.nix
    ./gnupg.nix
  ];
  home.packages = with pkgs; [

    bottom
    fd
    broot
    gitui
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    zoxide
    rbw
    pinentry-all
    zellij

    nixd # Nix LSP
    alejandra # Nix formatter
    nixfmt-rfc-style
    nvd # Differ
    nix-diff # Differ, more detailed
    nix-output-monitor
    nh # Nice wrapper for NixOS and HM
  ];
}

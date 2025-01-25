{ pkgs, ... }: {
=======
{ pkgs, ... }:
{
>>>>>>> bagelserver
  imports = [
    ./starship.nix
    ./git.nix
    ./helix.nix
    ./zsh.nix
    ./broot.nix
    ./rbw.nix
    ./zellij.nix
  ];
  home.packages = with pkgs; [
    bottom
    fd
    broot
    gitui
    nerd-fonts.fira-code
    zoxide
    pinentry
    nixd # Nix LSP
    alejandra # Nix formatter
    nixfmt-rfc-style
    nvd # Differ
    nix-diff # Differ, more detailed
    nix-output-monitor
    nh # Nice wrapper for NixOS and HM
  ];
}

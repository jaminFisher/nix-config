{ pkgs, ... }:
{
  users.users = {
    jaminfisher = {
      shell = pkgs.zsh;
      isNormalUser = true;
      description = "jaminfisher";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      packages = with pkgs; [
        gnupg
      ];
    };
  };
}

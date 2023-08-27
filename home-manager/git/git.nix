{ pkgs, lib, ... }:
{
    programs.git = {
        enable = true;
        userName = "Ben Fisher";
        userEmail = "jaminFisher@gmail.com";
    };

    programs.git-credential-oauth.enable = true;
}
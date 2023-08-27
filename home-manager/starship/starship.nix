{ pkgs, lib, ... }:
{
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        #enableNushellIntegration = true;
        enableBashIntegration = true;
    };

    xdg.congfigFile.starship = {
        source = ./starship.toml;    
    };
}
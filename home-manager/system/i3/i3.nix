{ pkgs, ... }:
{
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        blocks = [
          {
            block = "time";
            interval = 60;
            format = "%a %d/%m %k:%M %p";
          }
        ];
      };
    };
  };

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod1";
      fonts = {
        names = [ "FiraCode Nerd Font" ];
        style = "Mono";
        size = 8.0;
      };
      bars = [
        {
          position = "top";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
        }
      ];
    };
  };
}

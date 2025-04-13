{ ... }:
{
  programs.i3status-rust = {
    enable = true;
  };

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod1";
    };
  };

}

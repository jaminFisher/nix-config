{ ... }:
{
  services.xserver = {
    layout = "gb";
    xkbVariant = "";
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    windowManager.i3.enable = true;
  };

  service.xserver.displayManager.lightdm.enable = true;
}

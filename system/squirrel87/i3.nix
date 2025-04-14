{ ... }: {
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    xkb = {
      layout = "gb";
      variant = "";
    };
  };
  services.displayManager = { defaultSession = "none+i3"; };
}

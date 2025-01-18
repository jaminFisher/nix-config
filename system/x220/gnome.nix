{ ... }: {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkb.layout = "gb";
  };
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  programs.gpaste.enable = true;
}

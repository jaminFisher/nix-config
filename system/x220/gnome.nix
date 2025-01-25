{ pkgs, ... }: {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkb.layout = "gb";
  };
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    atomix
    cheese
    epiphany
    evince
    geary
    gedit
    gnome-characters
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour
    hitori
    iagno
    tali
    totem
    xterm
  ];

  programs.gpaste.enable = true;
}

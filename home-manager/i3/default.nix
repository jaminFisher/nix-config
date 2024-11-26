{ ... }:
{
  imports = [ ../apps/kitty.nix ];

  xsession.windowManager.i3.config = {
    terminal = "kitty";
  };
}

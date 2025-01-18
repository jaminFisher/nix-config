{ pkgs, ... }: {
  programs.rbw = {
    enable = true;
    settings = {
      email = "jaminfisher@gmail";
      base_url = "https://bagel-server.koi-hexatonic.ts.net:8222";
      pinentry = pkgs.pinentry-gnome3;
    };
  };
}

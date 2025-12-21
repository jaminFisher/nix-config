{ ... }:
{
  services.homepage-dashboard = {
    enable = true;
    services = [
      {
        "Services" = [
          {
            name = "Jellyfin";
            url = "http://bagel-server.koi-hexatonic.ts.net:8096";
            icon = "jellyfin";
          }
          {
            name = "Immich";
            url = "http://bagel-server.koi-hexatonic.ts.net:2283";
            icon = "immich";
          }
          {
            name = "Mealie";
            url = "http://bagel-server.koi-hexatonic.ts.net:9000";
            icon = "mealie";
          }
          {
            name = "Vaultwarden";
            url = "https://bagel-server.koi-hexatonic.ts.net:8222";
            icon = "vaultwarden";
          }
          {
            name = "Audiobookshelf";
            url = "http://bagel-server.koi-hexatonic.ts.net:8000";
            icon = "audiobookshelf";
          }
          {
            name = "Pinchflat";
            url = "http://bagel-server.koi-hexatonic.ts.net:3000";
            icon = "pinchflat";
          }
        ];
      }
    ];
  };
}

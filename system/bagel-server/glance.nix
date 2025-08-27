{ ... }:
{
  services.glance = {
    enable = true;
    settings = {
      pages = [
        {
          name = "Home";
          columns = [
            {
              size = "small";
              widgets = [
                {
                  type = "calendar";
                  first-day-of-week = "monday";
                }
                {
                  type = "rss";
                  limit = 10;
                  collapse-after = 3;
                  cache = "12h";
                  feeds = [
                    {
                      url = "https://selfh.st/rss/";
                      title = "selfh.st";
                      limit = 4;
                    }
                    { url = "https://ciechanow.ski/atom.xml"; }
                    {
                      url = "https://www.joshwcomeau.com/rss.xml";
                      title = "Josh Comeau";
                    }
                    { url = "https://samwho.dev/rss.xml"; }
                    {
                      url = "https://ishadeed.com/feed.xml";
                      title = "Ahmad Shadeed";
                    }
                  ];
                }
                # {
                #   type = "twitch-channels";
                #   channels = [
                #     "theprimeagen"
                #     "j_blow"
                #     "piratesoftware"
                #     "cohhcarnage"
                #     "christitustech"
                #     "EJ_SA"
                #   ];
                # }
              ];
            }
            {
              size = "full";
              widgets = [
                {
                  type = "server-stats";
                  servers = [
                    {
                      type = "local";
                      hide-mountpoints-by-default = false;

                      #   mountpoints = [
                      #     {
                      #       path = "/";
                      #       name = "Root";
                      #     }
                      #     {
                      #       path = "/mnt/data";
                      #       name = "Data";
                      #     }
                      #     {
                      #       path = "/boot/efi";
                      #       hide = true;
                      #     }
                      #   ];
                    }
                  ];
                }
                {
                  type = "monitor";
                  cache = "1m";
                  title = "Services";
                  sites = [
                    {
                      title = "Jellyfin";
                      url = "http://bagel-server.koi-hexatonic.ts.net:8096";
                      icon = "/assets/jellyfin-logo.png";
                    }
                    {
                      title = "Immich";
                      url = "http://bagel-server.koi-hexatonic.ts.net:2283";
                      icon = "/assets/immich-logo.png";
                    }
                    {
                      title = "Vaultwarden";
                      url = "http://bagel-server.koi-hexatonic.ts.net:8222";
                      icon = "/assets/vaultwarden-logo.png";
                    }
                    {
                      title = "Mealie";
                      url = "http://bagel-server.koi-hexatonic.ts.net:9000";
                      icon = "/assets/mealie-logo.png";
                    }

                    # {
                    #   title = "Gitea";
                    #   url = "https://gitea.yourdomain.com";
                    #   icon = "/assets/gitea-logo.png";
                    # }
                    # {
                    #   title = "AdGuard Home";
                    #   url = "https://adguard.yourdomain.com";
                    #   icon = "/assets/adguard-logo.png";
                    # }
                  ];
                }
                {
                  type = "group";
                  widgets = [
                    { type = "hacker-news"; }
                    { type = "lobsters"; }
                  ];
                }
                # {
                #   type = "videos";
                #   channels = [
                #     "UCXuqSBlHAE6Xw-yeJA0Tunw" # Linus Tech Tips
                #     "UCR-DXc1voovS8nhAvccRZhg" # Jeff Geerling
                #     "UCsBjURrPoezykLs9EqgamOA" # Fireship
                #     "UCBJycsmduvYEL83R_U4JriQ" # Marques Brownlee
                #     "UCHnyfMqiRRG1u-2MsSQLbXA" # Veritasium
                #   ];
                # }
                {
                  type = "group";
                  widgets = [
                    {
                      type = "reddit";
                      subreddit = "technology";
                      show-thumbnails = true;
                    }
                    {
                      type = "reddit";
                      subreddit = "selfhosted";
                      show-thumbnails = true;
                    }
                  ];
                }
              ];
            }
            {
              size = "small";
              widgets = [
                {
                  type = "weather";
                  location = "London, United Kingdom";
                  units = "metric";
                  hour-format = "12h";
                }
                {
                  type = "releases";
                  cache = "1d";
                  repositories = [
                    "glanceapp/glance"
                    "go-gitea/gitea"
                    "immich-app/immich"
                    "syncthing/syncthing"
                    "NixOS/nixpkgs"
                  ];
                }
              ];
            }
          ];
        }
      ];
    };
  };
}

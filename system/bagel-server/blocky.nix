{ ... }:
{
  services.blocky = {
    enable = true;
    settings = {
      ports.dns = 53; # Port for incoming DNS Queries.
      upstreams.groups.default = [
        "https://one.one.one.one/dns-query" # Using Cloudflare's DNS over HTTPS server for resolving queries.
      ];
      # For initially solving DoH/DoT Requests when no system Resolver is available.
      bootstrapDns = {
        upstream = "https://one.one.one.one/dns-query";
        ips = [
          "1.1.1.1"
          "1.0.0.1"
        ];
      };
      customDNS = {
        mappings = {
          "bagel.immich" = "http://bagel-server.koi-hexatonic.ts.net:2283/";
        };
      };

      #Enable Blocking of certian domains.
      blocking = {
        blackLists = {
          ads = [ "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" ];
          adult = [ "https://blocklistproject.github.io/Lists/porn.txt" ];
          #You can add additional categories
        };
        clientGroupsBlock = {
          default = [ "ads" ];
          kids-ipad = [
            "ads"
            "adult"
          ];
        };
      };
    };
  };
}

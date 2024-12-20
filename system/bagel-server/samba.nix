{ ... }:
{
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "smbnix";
        "netbios name" = "smbnix";
        "security" = "user";
        #"use sendfile" = "yes";
        #"max protocol" = "smb2";
        # note: localhost is the ipv6 localhost ::1
        "hosts allow" = "192.168.0. 127.0.0.1 localhost 100.97.53.166 100.120.168.142";
        "hosts deny" = "0.0.0.0/0";
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };
      "ExPi" = {
        "path" = "/mnt/ExPi";
        "browseable" = "yes";
        "writeable" = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "valid users" = "jaminfisher";
      };
      # "private" = {
      #   "path" = "/mnt/Shares/Private";
      #   "browseable" = "yes";
      #   "read only" = "no";
      #   "guest ok" = "no";
      #   "create mask" = "0644";
      #   "directory mask" = "0755";
      #   "force user" = "username";
      #   "force group" = "groupname";
      # };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  networking.firewall.enable = true;
  networking.firewall.allowPing = true;
}

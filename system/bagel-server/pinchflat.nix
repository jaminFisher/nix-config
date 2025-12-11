{ ... }:
let
  mediaDir = "/mnt/Seagate/MeTube";
in
{
  services.pinchflat = {
    enable = true;
    mediaDir = mediaDir;
    selfhosted = true;
  };

  # Add pinchflat user to media group
  users.users.pinchflat.extraGroups = [ "media" ];

  # Ensure directory exists with correct ownership and permissions
  systemd.tmpfiles.rules = [
    "d ${mediaDir} 2775 root media - -"
  ];
}

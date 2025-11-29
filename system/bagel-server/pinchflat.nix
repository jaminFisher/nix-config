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

  # Fix permissions on the media directory
  systemd.services.pinchflat.preStart = ''
    mkdir -p ${mediaDir}
    chown pinchflat:pinchflat ${mediaDir}
    chmod 755 ${mediaDir}
  '';
}

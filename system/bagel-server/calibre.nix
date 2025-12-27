{ ... }:
{
  services.calibre-web = {
    enable = true;
    group = "media";
    listen = {
      ip = "127.0.0.1";
      port = 8083;
    };
    options = {
      calibreLibrary = "/mnt/Seagate/ebook";
      enableBookUploading = true;
      enableBookConversion = true;
    };
  };

}
